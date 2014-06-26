require "coveralls"
require "simplecov"
SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter '/spec/'
  add_filter '/bundle/'
end

begin
  require 'pry-byebug'
rescue LoadError
end

require 'dashv'
def stub_invoke(expected)
  invoker = Dashv::Invoker.new
  allow(invoker).to receive(:exec).and_return(expected)
  allow(Dashv::Invoker).to receive(:new).and_return(invoker)
end
