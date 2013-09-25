module PaintingHelpers
  def paintings_collection
    Dir.entries("#{root}/source/images/paintings").select{|entry| entry =~ /^.+\.(jpg|png|gif|jpeg)$/}
  end
end
