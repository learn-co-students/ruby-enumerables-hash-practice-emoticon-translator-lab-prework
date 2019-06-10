# require modules here
require "yaml"

def load_library(filePath)
  # code goes here
  temp = YAML.load_file(filePath)
  library = {"get_emoticon" => {}, "get_meaning" => {}}
  temp.each do |k, v| 
    library["get_meaning"][v[1]] = k
    library["get_emoticon"][v[0]] = v[1]
  end
  return library
end

def get_japanese_emoticon(filePath, emoticon)
  # code goes here
  library = load_library(filePath)
  if library["get_emoticon"].include?(emoticon)
    return library["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(filePath, emoticon)
  # code goes here
  library = load_library(filePath)
  if library["get_meaning"].include?(emoticon)
    return library["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end