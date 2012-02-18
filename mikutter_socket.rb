#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# Echo client program
require 'socket'

HOST = 'localhost'
PORT = 3939         # The same port as used by the server

s = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)
sockaddr = Socket.sockaddr_in(PORT, HOST)
s.connect(sockaddr)
s.write ARGV[0]
#data = s.recv(1024)
s.close
#puts "Received #{data}"
