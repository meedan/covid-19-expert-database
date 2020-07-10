#!/usr/bin/env ruby

##
# csv2json infile.csv outfile.json
##

require 'csv'
require 'json'

lines = CSV.open(ARGV[0], 'r:bom|utf-8').readlines
keys = lines.delete(lines.first).map do |key|
  key.strip
end
File.open(ARGV[1], 'w') do |f|
  data = lines.select { |values| values.any? }.map do |values|
    Hash[keys.zip(values)]
  end
  f.puts JSON.pretty_generate(data)
end