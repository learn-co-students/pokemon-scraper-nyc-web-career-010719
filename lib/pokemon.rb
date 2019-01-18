class Pokemon

  attr_reader :id, :name, :type, :db

  @@all = []

  def self.all
    @@all
  end

  def initialize(id:, name:, type:, db:)
    @id = @@all.length + 1
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(name, type, db)
    pokemon = Pokemon.all.find do |poke|
      poke.name == name && poke.type == type
    end
    id = pokemon.id
    sql = "INSERT INTO pokemon(id, name, type) VALUES (?, ?, ?)"
    db.execute(sql, id, name, type)
  end

end
