require_relative '../bin/sql_runner'
class Pokemon
  attr_accessor :name,:type,:db,:id,:hp
  # attr_reader :id
  def initialize(name:,type:,db:,id:, hp: nil)#id=nil,name,type,db
    @name = name
    @type = type
    @id =id
    @db = db

    # @sqlrunner = SQLRunner.new('./db/pokemon.db')
    # @db = SQLite3::Database.new('../pokemon.db')
    # @db.execute("DROP TABLE IF EXISTS pokemon;")
    # @sql_runner = SQLRunner.new(@db)
    # @sql_runner.execute_schema_migration_sql
    # binding.pry

  end

  def self.save (name,type, db)
    s = <<-SQL
      INSERT INTO pokemon (name,type)
      VALUES (?,?,?);
    SQL
    db.execute("INSERT INTO pokemon (name,type) VALUES (?,?)",name,type)
  end

  def self.find(id,db)
    find_poke=db.execute('SELECT * FROM pokemon WHERE pokemon.id=?', id).flatten
    # binding.pry
    find_id = find_poke[0]
    find_name = find_poke[1]
    find_type = find_poke[2]
    # Pokemon.save(find_name,find_type,db)
    p = Pokemon.new( id: find_id,name: find_name,type: find_type,db:db )
    # binding.pry
  end
  def alter_hp
    magikarp = Pokemon.find(2,db)
    magikarp


  end
end
