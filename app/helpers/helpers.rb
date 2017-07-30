def isolate_tags(string_of_tags)
  tag_array = string_of_tags.split(',').map {|each| each.strip}
  tag_array.reject {|each| each.empty? }
end
