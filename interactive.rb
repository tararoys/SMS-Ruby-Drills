require "pty"



PTY.spawn("ruby_drills") do |read, write|
    Thread.new do
        loop do
            write.print STDIN.getc.chr
        end
    end

    loop do
        print read.sysread(512)
        STDOUT.flush
    end
end
