require 'socket'

if ARGV.count != 2
  raise 'Illegal argument count'
end

def accept(address, port, sec)
  serv = TCPServer.new(port)
  serv.listen(1)

  loop do
    ok, i1, i2 = get_i(serv)

    if !ok
      break
    end

    sleep(sec)
    send_i(address, port, i1, i2)
  end
ensure
  serv&.close
end

def get_i(serv)
  rx  = serv.accept
  str = rx.gets&.chomp

  if !str || str.empty?
    return false, 0, 0
  end

  nums = str.split

  if nums.count != 2
    return false, 0, 0
  end

  i1 = nums[0].to_i
  i2 = nums[1].to_i

  puts i1
  puts i2

  return true, i1, i2
ensure
  rx&.close
end

def send_i(address, port, i1, i2)
  str = fib(i1, i2)
  
  tx = TCPSocket.new(address, port)
  tx.puts(str)
ensure
  tx&.close
end

def fib(i1, i2)
  "#{i2} #{i1 + i2}"
end

accept(ARGV[0], ARGV[1], 1)
