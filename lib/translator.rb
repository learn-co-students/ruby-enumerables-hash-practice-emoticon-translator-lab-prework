# require modules here
require 'yaml'

def load_library(path)
  # code goes here
  translations = {}
  emoticons    = YAML.load_file(path)
  
  emoticons.each do | name, meaning |
    translations[name]            = {}
    translations[name][:english]  = meaning[0]
    translations[name][:japanese] = meaning[1]
  end
  
  translations
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  puts emoticon
  load_library(path).each do | translation, meaning |
    if meaning[:english] == emoticon
      return meaning[:japanese]
    end
  end
  
  'Sorry, that emoticon was not found'
end

def get_english_meaning(path, emoticon)
  # code goes here
  load_library(path).each do | translation, meaning |
    if meaning[:japanese] == emoticon
      return translation
    end
  end
  
  'Sorry, that emoticon was not found'
end