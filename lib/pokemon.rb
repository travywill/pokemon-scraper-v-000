class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = (?)", id).flatten
    pokemon_id = pokemon_array[0]
    pokemon_name = pokemon_array[1]
    pokemon_type = pokemon_array[2]
    pokemon_db = db
    new_pokemon = Pokemon.new(id: pokemon_id, name: pokemon_name, type: pokemon_type, db: pokemon_db)
    new_pokemon
  end
end
