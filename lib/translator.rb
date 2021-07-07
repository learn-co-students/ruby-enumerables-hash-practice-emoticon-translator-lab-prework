require 'yaml'
require 'pry'

def load_library(emoticons_dictionary)
  loaded_emoticons_dictionary = YAML.load_file(emoticons_dictionary)
  sorted_dictionary = {:get_meaning => {}, :get_emoticon => {}}
  loaded_emoticons_dictionary.each do |name, symbols|
    sorted_dictionary[:get_meaning][symbols[1]] = name
    sorted_dictionary[:get_emoticon][symbols[0]] = symbols[1]
  end
  sorted_dictionary
end

def get_english_meaning(emoticons_dictionary, emoticon)
  loaded_emoticons = load_library(emoticons_dictionary) 
  temporary_value = loaded_emoticons[:get_meaning][emoticon]
    if temporary_value == nil
      return "Sorry, that emoticon was not found"
    end
  return temporary_value
end

def get_japanese_emoticon(emoticons_dictionary, emoticon)
  imported_emoticons = load_library(emoticons_dictionary) 
  value = imported_emoticons[:get_emoticon][emoticon]
    if value == nil
      return "Sorry, that emoticon was not found"
    end
  return value
end
