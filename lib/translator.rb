# require modules here
require "yaml"

def load_library(file)
  emoticons = YAML.load_file(file)                #emoticons is hash of arrays
  new_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  emoticons.each do |key,value|
    new_hash["get_meaning"][value[1]] = key       
            #get_meaning hash is jap emotes keys pointing to eng emotes values
    new_hash["get_emoticon"][value[0]] = emoticons[key][1]
            #get_emoticon hash is eng emotes keys pointing to jap emotes values
  end
  new_hash
end


def get_japanese_emoticon(file, emoticon)  
  jap_emotes = load_library(file)["get_emoticon"][emoticon]
                      #return value for laod_library is new_hash
  if load_library(file)["get_emoticon"].key?(emoticon)
    jap_emotes
  else
    "Sorry, that emoticon was not found"
  end
end


def get_english_meaning(file,emoticon)
  eng_emotes = load_library(file)["get_meaning"][emoticon]
  if eng_emotes
  #if load_library(file)["get_meaning"].key?(emoticon)
    eng_emotes
  else
    "Sorry, that emoticon was not found"
  end
end











