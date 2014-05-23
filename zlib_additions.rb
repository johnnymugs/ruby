module Zlib
  class GzipReader
    def self.each_file(io)
      require 'byebug'
      byebug
      io.open
      output = []
      while !io.eof?
        output << Zlib::GzipReader.new(io)
      end
      output
    end
  end
end

