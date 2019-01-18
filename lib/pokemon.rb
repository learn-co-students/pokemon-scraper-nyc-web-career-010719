require 'pry'
class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    # binding.pry
    new_poke = db.execute("SELECT * FROM pokemon WHERE id=#{id}").flatten
    # binding.pry
    Pokemon.new(id: new_poke[0], name: new_poke[1], type: new_poke[2], db: new_poke[3])
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end # end of Pokemon class
