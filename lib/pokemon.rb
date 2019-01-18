require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:,name:,type:,hp: nil,db:)
    # binding.pry
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.find(id,db)
    pokedex = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?",id).flatten
    # binding.pry
    Pokemon.new(id: pokedex[0], name: pokedex[1], type: pokedex[2], hp: pokedex[3], db: db)
  end

  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?,?)",name,type)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
end
