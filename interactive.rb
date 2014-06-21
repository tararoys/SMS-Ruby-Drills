require "pty"



PTY.spawn("ruby_drills") do |pin, pout|
    Thread.new do
        loop do
            pout.print STDIN.getc.chr
        end
    end

    loop do
        print pin.sysread(512)
        STDOUT.flush
    end
end
