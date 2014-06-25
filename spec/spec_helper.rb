begin
  require 'pry-byebug'
rescue LoadError
end

def stub_invoke(expected)
  invoker = DashV::Invoker.new
  allow(invoker).to receive(:exec).and_return(expected)
  allow(DashV::Invoker).to receive(:new).and_return(invoker)
end
