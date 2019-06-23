# Metaprogramming is writting code that writes code.

class Greeting
  def initialize(text)
    @text = text  # variable of instance
  end

  def welcome
    @text
  end
end

my_object = Greeting.new('Hello')

my_object.class
my_object.class.instance_methods(false)  # => [:welcome]
Greeting.instance_methods(false)
my_object.instance_variables

class Entity
  attr_reader :table, :ident

  def initialize(table, ident)
    @table = table
    @ident = ident
    Database.sql "INSERT INTO #{@table} (id) VALUES (#{@ident})"
  end

  def set(col, val)
    Database.sql "UPDATE #{@table} SET #{col}='#{val} WHERE id=#{ident}"
  end

  def get(col)
    Database.sql ("SELECT #{col} FROM #{@table} WHERE id=#{@ident}")[0][0]
  end
end
