require "socket"

Plugin.create(:mikutter_server) do
  Thread.new {
    gs = TCPServer.open("localhost", 3939)
    addr = gs.addr
    addr.shift
    printf("server is on %s\n", addr.join(":"))
    
    while true
      Thread.start(gs.accept) do |s|       # save to dynamic variable
        print(s, " is accepted\n")
        while s.gets
          Post.primary_service.post :message => "#{$_}"
        end
        print(s, " is gone\n")
        s.close
      end
    end
  }
end
