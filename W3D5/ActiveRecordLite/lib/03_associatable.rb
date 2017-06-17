require_relative '02_searchable'
require 'active_support/inflector'
require 'byebug'

# Phase IIIa
class AssocOptions
  # include Associatable
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    # ...
    @class_name.constantize
  end

  def table_name
    # ...
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})

    unless name.is_a?(String)
      name = name.to_s
    end

    defaults = {
      foreign_key: "#{name.underscore}_id".to_sym,
      class_name: name.camelcase.singularize,
      primary_key: :id
    }

    defaults.keys.each do |key|
      if options[key].nil?
        self.send("#{key}=", defaults[key])
      else
        self.send("#{key}=", options[key])
      end
    end
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    # ...

    unless name.is_a?(String)
      name = name.to_s
    end

    defaults = {
      foreign_key: "#{self_class_name.underscore}_id".to_sym,
      class_name: name.camelcase.singularize,
      primary_key: :id
    }

    defaults.keys.each do |key|
      if options[key].nil?
        self.send("#{key}=", defaults[key])
      else
        self.send("#{key}=", options[key])
      end
    end
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)

    define_method(name) do
      f_key = self.send(options.foreign_key)
      target_class = options.model_class
      target_class.where(options.primary_key => f_key).first
    end
    # ...
  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  # Mixin Associatable here...
  extend Associatable
end
