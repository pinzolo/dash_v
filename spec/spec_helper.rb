begin
  require 'pry-byebug'
rescue LoadError
end

def stub_invoke(expected)
  invoker = Dashv::Invoker.new
  allow(invoker).to receive(:exec).and_return(expected)
  allow(Dashv::Invoker).to receive(:new).and_return(invoker)
end
