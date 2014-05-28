module Zlib
  class GzipReader
    def self.each_file(io)
      io.open
      gz = Zlib::GzipReader.new(io)
      output = [gz]
      gz.read
      gz.rewind
      while gz.unused
        io.pos -= gz.unused.size
        gz.unused = nil

        gz = Zlib::GzipReader.new(io)
        gz.read
        gz.rewind
        output << gz
      end
      io.close
      output
    end
  end
end

