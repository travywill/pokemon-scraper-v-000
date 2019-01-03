class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    @db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def find
    #
  end
end
