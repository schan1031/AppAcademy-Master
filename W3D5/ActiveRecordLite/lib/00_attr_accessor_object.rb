class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # ...
    names.each do |var|
      define_method(var) do
        instance_variable_get("@#{var}")
      end
    end

    names.each do |var|
      define_method("#{var}=") do |val|
        instance_variable_set("@#{var}", val)
      end
    end
  end
end
