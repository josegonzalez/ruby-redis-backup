#!/usr/bin/env ruby
# -*- encoding : utf-8 -*-

require 'optparse'
require 'ostruct'

require File.expand_path('../version', __FILE__)

module RedisBackup
  class Options
    def self.parse(args)
      options = OpenStruct.new

      options.backup_dir = "/data/backup/redis"
      options.redis_host = "localhost"
      options.redis_port = 6379
      options.redis_save_method = false
      options.redis_source = "/var/lib/redis/dump.rdb"
      options.s3_save = !!ENV.fetch("S3_SAVE", false)
      options.s3_bucket = false
      options.s3_access_key_id = false
      options.s3_secret_access_key = false

      optparse = OptionParser.new do |opts|
        opts.version = "redis-backup " + RedisBackup::VERSION

        opts.banner = "Usage: redis-backup [options]"
        opts.separator ""
        opts.separator "Specific options:"

        opts.on('-b', '--backup-dir BACKUP_DIR', 'Directory to write backups to') { |dir| options.backup_dir = dir }
        opts.on('-c', '--compress', 'Compress backup as a zip file') { |dir| options.compress = true }
        opts.on('-s', '--redis-source REDIS_SOURCE', 'Full path to redis dump.rdb file') { |source| options.redis_source = source }
        opts.on('-m', '--redis-save-method REDIS_SAVE_METHOD', 'The method to call on redis for saving (save or bgsave or none)') { |method| options.redis_save_method = method }
        opts.on('-H', '--redis-host REDIS_HOST', 'Host for local redis') { |host| options.redis_host = host }
        opts.on('-p', '--redis-port REDIS_PORT', 'Port for local redis') { |port| options.redis_port = port.to_i }
        opts.on('-A', '--s3-access-key-id S3_ACCESS_KEY_ID', 'Your access_key_id for AWS S3') { |key| options.s3_access_key_id = key }
        opts.on('-B', '--s3-bucket S3_BUCKET', 'Name of bucket to use on S3') { |bucket| options.s3_bucket = bucket }
        opts.on('-C', '--s3-clean', 'Cleanup intermediate backup files') { |dir| options.clean = true }
        opts.on('-S', '--s3-secret-access-key S3_SECRET_ACCESS_KEY', 'Your secret_access_key for AWS S3') { |secret| options.s3_secret_access_key = secret }

        opts.separator ""
        opts.separator "Common options:"

        opts.on_tail('-h', '--help', 'Show this message') do
          puts opts
          exit
        end

        # Another typical switch to print the version.
        opts.on_tail("--version", "Show version") do
          puts "redis-backup " + RedisBackup::VERSION
          exit
        end
      end
      optparse.parse!(args)

      options.s3_save = !!options.s3_bucket && !!options.s3_access_key_id && !!options.s3_secret_access_key
      options
    end
  end
end
