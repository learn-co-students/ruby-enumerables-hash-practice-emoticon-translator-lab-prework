require "yaml"

def load_library(file_to_load)
  loaded_file = YAML.load_file(file_to_load)
  return_info = {
    "get_meaning" => {},
    "get_emoticon" => {},
  }
  loaded_file.each do |k, v|
    return_info["get_meaning"][v[1]] = k
    return_info["get_emoticon"][v[0]] = v[1]
  end
  return_info
end

def get_japanese_emoticon(file_to_load, emoticon)
  #inputs enlgish emoticon and returns translated japanese emoticon
  emote_list = load_library(file_to_load)
  emote_list["get_emoticon"].each do |k, v|
    if k == emoticon
      return v
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_to_load, emoticon)
  #inputs japanese emoticon and returns english meaning
  emote_list = load_library(file_to_load)
  emote_list["get_meaning"].each do |k, v|
    if k == emoticon
      return v
    end
  end
  "Sorry, that emoticon was not found"
end