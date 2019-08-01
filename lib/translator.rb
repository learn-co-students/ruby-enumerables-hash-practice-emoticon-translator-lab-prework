# require modules here
require "yaml"

def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)
  emoticon_hash = {}
  get_meaning = {} 
  get_emoticon = {}

  emoticons.each do |english, set|
    get_meaning[set.last] = english
    get_emoticon[set.first] = set.last
  end
  
  emoticon_hash = {
    "get_meaning" => get_meaning,
    "get_emoticon" => get_emoticon
  }
  
  emoticon_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes 
  library = load_library(file_path)
  japanese_emoticon = library["get_emoticon"][emoticon]
  if japanese_emoticon.nil? 
    return "Sorry, that emoticon was not found"
  end
  japanese_emoticon
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  library = load_library(file_path)
  english_meaning = library ["get_meaning"][emoticon]
  if english_meaning.nil?
    return "Sorry, that emoticon was not found"
  end
  english_meaning
end