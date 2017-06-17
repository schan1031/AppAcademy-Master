require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    if @cols
      @cols
    else
      @cols = DBConnection.execute2(<<-SQL)
        SELECT
          *
        FROM
          #{table_name}
        LIMIT
          0
      SQL
      @cols = @cols.first.map(&:to_sym)
    end
  end

  def self.finalize!
    self.columns.each do |col|
      define_method(col) do
        self.attributes[col]
      end

      define_method("#{col}=") do |val|
        self.attributes[col] = val
      end
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    @table_name ||= self.name.tableize
    # if @table_name
    #   @table_name
    # else
    #   self.name.tableize
    # end
  end

  def self.all
    # ...
    hashes = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL

    parse_all(hashes)
  end

  def self.parse_all(results)
    # ...
    results.map { |hash| self.new(hash) }
  end

  def self.find(id)
    # ...
    ins = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        id = "#{id}"
    SQL
    parse_all(ins).first
  end

  def initialize(params = {})
    params.each do |k, v|
      k = k.to_sym
      if self.class.columns.include?(k)
        self.send("#{k}=", v)
        # self.attributes[k] = v
      else
        raise "unknown attribute '#{k}'"
      end
    end
    # ...
  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
    # @attributes.values
    self.class.columns.first.map { |col| self.send(col)}
  end

  def insert
    # ...
    cols = self.class.columns.first.drop(1)
    colnames = cols.map(&:to_s).join(', ')
    q_marks = (['?'] * cols.length).join(', ')
    vals = attribute_values.drop(1)
    # byebug
    DBConnection.execute(<<-SQL, vals)
      INSERT INTO
        #{self.class.table_name} (#{colnames})
      VALUES
        (#{q_marks})
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    # ...
    id = self.id
    cols = self.class.columns.first.drop(1)
    colnames = cols.map { |column| column.to_s + ' = ?' }.join(', ')
    vals = attribute_values.drop(1)
    # byebug
    DBConnection.execute(<<-SQL, vals)
      UPDATE
        #{self.class.table_name}
      SET
        #{colnames}
      WHERE
        id = #{id}
    SQL
  end

  def save
    # ...
    self.id.nil? ? insert : update
  end
end
