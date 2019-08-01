require "yaml"

def load_library(file_path)
  library = YAML.load_file(file_path)
  new_hash = { 
   'get_meaning' => {},
   'get_emoticon' => {}
  }
  
library.each do |key, value|
  new_hash['get_emoticon'][value[0]] = library[key][1]
  new_hash['get_meaning'][value[1]] = key

end
new_hash
end 

def get_japanese_emoticon(file_path, emoji)
    translation = load_library(file_path)['get_emoticon'][emoji]
    translation ? translation : "Sorry, that emoticon was not found"
end


def get_english_meaning (file_path, emoji)
  library = load_library(file_path)
  if library["get_meaning"].include?(emoji) 
    library["get_meaning"][emoji]
  else
    "Sorry, that emoticon was not found"
  end
end