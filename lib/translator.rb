require 'yaml' 

def load_library(file)
  load_hash = YAML.load_file(file)

  library_hash = {'get_emoticon' => {}, 'get_meaning' => {}}

  load_hash.each do |meaning, emoticons|
    english = emoticons[0]
    japanese = emoticons[1]

    library_hash['get_meaning'][japanese] = meaning
    library_hash['get_emoticon'][english] = japanese

  end
  library_hash
end

def get_japanese_emoticon(file, emoticon)
  library = load_library(file)
  result = library['get_emoticon'][emoticon]

  result ? result : "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  library = load_library(file)
  result = library['get_meaning'][emoticon]

  result ? result : "Sorry, that emoticon was not found"
end