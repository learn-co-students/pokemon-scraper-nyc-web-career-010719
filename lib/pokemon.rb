class Pokemon

  attr_reader :id, :name, :type, :db, :hp

  @@all = []

  def self.all
    @@all
  end

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    p = db.execute(sql, id).flatten
    poke = Pokemon.new(id: p[0], name: p[1], type: p[2], hp: p[3], db: db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
end
