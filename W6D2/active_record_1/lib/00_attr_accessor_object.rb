class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      define_method(name) do 
        self.instance_variable_get("@#{name}")
      end
      define_method("#{name}=") do |obj|
        self.instance_variable_set("@#{name}", obj)
      end
    end
  end
end

