class Pokemon


  attr_accessor :id, :name, :type, :hp, :db
  @@all = []

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type)
    VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    poke_find = db.execute("SELECT * FROM pokemon WHERE id = #{id}").flatten
    Pokemon.new(id: poke_find[0], name: poke_find[1], type: poke_find[2], hp: poke_find[3], db: db)

  end

  def alter_hp(alter_hp, hp)
    db.execute("UPDATE pokemon SET hp = #{alter_hp} WHERE id = #{id}")
  end
end
