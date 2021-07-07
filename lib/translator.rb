require "yaml"

def load_library(file_path)
  
  emoticons = YAML.load_file(file_path)
  
  myHash = { 
    'get_meaning' => {},
    'get_emoticon' => {}
  }
  
  emoticons.each do |key, value|
    myHash['get_emoticon'][value[0]] = emoticons[key][1]
    myHash['get_meaning'][value[1]] = key
  end
  myHash
end

def get_japanese_emoticon(file_path, emoticon)
  result = load_library(file_path)['get_emoticon'][emoticon]
  result ? result : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  result = load_library(file_path)['get_meaning'][emoticon]
  result ? result : "Sorry, that emoticon was not found"
end