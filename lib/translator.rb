require  "pry"
require "yaml"

def load_library(file_path)
  yaml_hash = YAML.load_file(file_path)
  emoticon_hash = {get_emoticon: {}, get_meaning: {}}
  
  yaml_hash.each do |key, value| 
  emoticon_hash[:get_emoticon][value[0]] = value[1]
  emoticon_hash[:get_meaning][value[1]] = key
  end
  emoticon_hash
end


def get_japanese_emoticon(file_path, emoticon)
 load_library(file_path).each do |key, value|
    value.each do |data|
      if data[0] == emoticon
        return data[1]
      end
    end
    return "Sorry, that emoticon was not found"
  end
end


def get_english_meaning(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  
  emoticon_hash[:get_meaning].each do |japanese_emo, eng_meaning|
    if japanese_emo == emoticon
      return eng_meaning
    end
  end
  return "Sorry, that emoticon was not found"
end