# require modules here
require "yaml"


def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  
  new_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  
  emoticons.each do |key, value_arr|
    new_hash["get_meaning"][value_arr[1]] = key
    new_hash["get_emoticon"][value_arr[0]] = value_arr[1]
  end
  
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  working_hash = load_library(file_path)
  
  if working_hash["get_emoticon"][emoticon]
    working_hash["get_emoticon"][emoticon]
  else 
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  working_hash = load_library(file_path)
  
  if working_hash["get_meaning"][emoticon]
    working_hash["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end