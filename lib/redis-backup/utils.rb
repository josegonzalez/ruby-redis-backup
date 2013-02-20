#!/usr/bin/env ruby
# -*- encoding : utf-8 -*-

module RedisBackup
  class Utils
    def self.filesize(filename)
      compressed_file_size = File.size(filename).to_f / 2**20
      '%.2f MB' % compressed_file_size
    end

    def self.colorize(text, color_code)
      RUBY_PLATFORM =~ /win32/ ?  text : "#{color_code}#{text}\e[0m";
    end

    def self.red(text)
      colorize(text, "\e[31m")
    end

    def self.green(text)
      colorize(text, "\e[32m")
    end

    def self.yellow(text)
      colorize(text, "\e[33m")
    end

    def self.blue(text)
      colorize(text, "\e[34m")
    end

    def self.magenta(text)
      colorize(text, "\e[35m")
    end

    def self.cyan(text)
      colorize(text, "\e[36m")
    end

    def self.white(text)
      colorize(text, "\e[37m")
    end

    def self.bold(text)
      colorize(text, "\e[1m")
    end

    def self.grey(text)
      colorize(text, "\e[90m")
    end

  end
end
