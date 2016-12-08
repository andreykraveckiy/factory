class Factory
  def self.new(*fields, &block)
    Class.new do  
      attr_reader *fields    
      define_method :initialize do |*vars|
        fields.each { |field| instance_variable_set('@'+field.to_s, vars.shift) }
      end 

      define_method :[] do |arg|
        get_var = arg.is_a?(Integer) ? fields[arg] : arg
        instance_eval get_var.to_s
      end 

      class_eval(&block) if block_given?   
    end
  end
end