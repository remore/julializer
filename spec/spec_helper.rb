require 'pp'
require_relative "../lib/julializer.rb"

RSpec::Matchers.define :be_equivalent_to do |julia_expected|
  match do |ruby|
    ruby_with_print_statement = ruby.kind_of?(Array) ? (ruby[0..-2]+["print(#{ruby.last})"]).join(";") : "print(#{ruby})"
    File.write("./tmp-code-for-spec.rb", ruby_with_print_statement)
    ruby_executed = `ruby ./tmp-code-for-spec.rb`.chomp
    julialized_source = Julializer.ruby2julia(ruby_with_print_statement)
    File.write("./tmp-code-for-spec.jl", julialized_source)
    julialized_executed = `julia ./tmp-code-for-spec.jl`.chomp
    p "evaluating: ruby=#{ruby}, ruby_executed=#{ruby_executed}, julialized_source=#{julialized_source}, julialized_executed=#{julialized_executed}"  if ENV['JULIALIZE_DEBUG']
    result_ruby = result_julia = false
    begin
      ruby_evaluated = eval(ruby.kind_of?(Array) ? ruby.join(";") : ruby).to_s
      julialized_executed_evaluated = eval(to_ruby(julialized_executed)).to_s
      p ruby_evaluated
      p julialized_executed
      p julialized_executed_evaluated
      result_ruby = Float(ruby_evaluated) == Float(julialized_executed_evaluated)
    rescue Exception => e
      if defined?(ruby_evaluated) && defined?(julialized_executed_evaluated) \
         && !ruby_evaluated.nil? && !julialized_executed_evaluated.nil? then
        result_ruby = ruby_evaluated == julialized_executed_evaluated
      end
    end
    begin
      result_julia = julia_expected == julialized_executed
    rescue Exception => e
      nil
    end
    p "result: ruby=#{result_ruby}, julia=#{result_julia}" if ENV['JULIALIZE_DEBUG']
    pp Ripper.sexp(ruby_with_print_statement) if ENV['JULIALIZE_DEBUG'] && (!result_ruby || !result_julia)
    result_ruby || result_julia
  end
end

module Helpers
  def to_ruby(array)
    array.gsub(/\((.*)\)/, '[\1]') #taple to array
         .gsub(/Inf/, 'Float::INFINITY') # Inf to Float::INFINITY
         .gsub(/NaN/, 'Float::NAN') # Inf to Float::INFINITY
         .gsub(/Any\[/, '[')
  end
end

RSpec.configure do |config|
  config.include Helpers
  config.expect_with(:rspec) { |c| c.syntax = :should }
end
