module Dashv::Ext
  def dashv
    Dashv[self.to_s]
  end
end
