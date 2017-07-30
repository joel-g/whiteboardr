module ApplicationHelper

  def isolate_tags(string_of_tags)
    tag_array = string_of_tags.split(',').map {|each| each.strip.downcase}
    tag_array.reject {|each| each.empty? }
  end

end
