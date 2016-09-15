class Request_Handler
  def method_missing sym, *args, &block
    
    else
      super sym, *args, &block
    end
  end
end
rh = Request_Handler.new
rh.galvanize('hello','world'){|a,b| puts a; puts b}