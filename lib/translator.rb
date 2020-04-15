require "yaml"
require "pry"

def load_library(address)
  load = YAML.load_file(address)
  hash = {:get_emoticon => {}, :get_meaning=>{}}
  load.keys.each do |meaning|
    hash[:get_emoticon][load[meaning][0]] = load[meaning][1]
    hash[:get_meaning][load[meaning][1]] = meaning
  end
  hash
end

def get_japanese_emoticon(path, emoticon)
  lib = load_library(path)
  if lib[:get_emoticon][emoticon].nil?
    "Sorry, that emoticon was not found"
  else
    lib[:get_emoticon][emoticon]
  end
end

def get_english_meaning(path, emoticon)
  lib = load_library(path)
  if lib[:get_meaning][emoticon].nil?
    "Sorry, that emoticon was not found"
  else
    lib[:get_meaning][emoticon]
  end
end
