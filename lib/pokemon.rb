class Pokemon

  attr_accessor :id, :name, :type, :hp, :db

  @@all = []

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
    @@all << self
  end

  def self.all
   @@all
   end

   def self.save(name, type, db)
     db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
   end

   def self.find(pokemon_id, db)
     poke_info = db.execute("SELECT * FROM pokemon WHERE id=?", pokemon_id).flatten
     Pokemon.new(id: poke_info[0], name: poke_info[1], type: poke_info[2], hp: poke_info[3], db: db)
   end

   def alter_hp(new_hp, db)
     db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
   end

end
