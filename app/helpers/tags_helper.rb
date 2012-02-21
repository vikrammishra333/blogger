module TagsHelper

  def header_tag
    tags = Hash.new
    tags = {
      :edit => "Edit Tag",
      :new => "Create a Tag",
      :create => "Create a Tag",
      :update => "Edit Tag",
      :index => "index"

    }
    return tags[action_name.to_sym]
  end
  
end
