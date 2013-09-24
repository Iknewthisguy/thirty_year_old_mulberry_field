module PaintingHelpers
  def paintings_collection
    Dir.entries("#{root}/source/images/paintings").reject{|entry| entry =~ /^\.{1,2}$/}
  end
end
