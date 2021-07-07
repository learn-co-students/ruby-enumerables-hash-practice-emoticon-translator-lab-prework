# require modules here
require "pry"
require 'yaml'
emoticon = YAML.load_file("./lib/emoticons.yml")

def load_library(emoticon)
  emoji = YAML.load_file("./lib/emoticons.yml")
  # code goes here
  new_hash = {
    :get_meaning => {},
      :get_emoticon => {}}
      emoji.each do |key, value|
      new_hash[:get_meaning][value[1]] = key
      new_hash[:get_emoticon][value[0]] = value[1]
  end
  new_hash
  #binding.pry
end

def get_japanese_emoticon(emoticon,emoji)
  load_lib = load_library(emoticon)
  # code goes here
  if load_lib[:get_emoticon].include?(emoji)
    return load_lib[:get_emoticon][emoji]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(emoticon,emoji)
  # code goes here
  load_lib = load_library(emoticon)
  if load_lib[:get_meaning].include?(emoji)
    return load_lib[:get_meaning][emoji]
  else
    return "Sorry, that emoticon was not found"
  end
end