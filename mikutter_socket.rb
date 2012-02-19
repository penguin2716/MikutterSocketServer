#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# Echo client program
require 'socket'

HOST = 'localhost'
PORT = 3939         # The same port as used by the server

inputstr = ''

if(ARGV.length == 0)
	STDOUT.puts 'input text (end with EOF)...'
	while line = STDIN.gets
		if(line == nil)
			break;
		end
		inputstr += line
	end
else
	inputstr = ARGV[0]
end

s = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)
sockaddr = Socket.sockaddr_in(PORT, HOST)
s.connect(sockaddr)
s.write inputstr
s.close
