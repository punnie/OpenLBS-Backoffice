xml.instruct!
xml.packages (:type => 'array') do
  @packages.each do |p|
    xml.package do 
      xml.id p.id
      xml.name p.name
      xml.version p.version
    end
  end
end
