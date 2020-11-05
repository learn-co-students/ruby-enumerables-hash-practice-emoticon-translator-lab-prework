require 'pry'

def load_library(yaml_file)
  require "yaml"
  emoticons = YAML.load_file('./lib/emoticons.yml')
  emoticons.each do |key, value|
    emoticons[key] = {
      :english => value[0],
      :japanese => value[1]
    }
  end
end

def get_japanese_emoticon(yaml_file, emoticon)
  yaml_file = load_library(yaml_file)
  yaml_file.each_value do |value|
    if value[:english] == emoticon
      return value[:japanese]
    end
  end
  'Sorry, that emoticon was not found'
end

def get_english_meaning(yaml_file, emoticon)
  yaml_file = load_library(yaml_file)
  yaml_file.each do |key, value|
    if value[:japanese] == emoticon
      return key
    end
  end
  'Sorry, that emoticon was not found'
end