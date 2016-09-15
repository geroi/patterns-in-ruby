require 'forwardable'
class Database
  extend Forwardable

  def_delegator :@adapter, :find
  def_delegator :@adapter, :delete
  def_delegator :@adapter, :all

  def initialize(file: nil, adapter: :mysql)
    @file = file
    @adapter = case adapter
          when :mysql then Adapters::MysqlAdapter.new @file
          when :nosql then Adapters::NosqlAdapter.new @file
          when :sqlite3 then Adapters::Sqlite3Adapter.new @file
          end
  end

end

module Adapters
  class MysqlAdapter
    extend Forwardable
    def initialize file
      @mysql = MySQL.new file
    end
    def_delegator :@mysql, :select, :find
    def_delegator :@mysql, :alter, :delete
    def_delegator :@mysql, :fetch, :all
  end

class NosqlAdapter
  extend Forwardable
    def initialize file
      @nosql = NoSQL.new file
    end
    def_delegator :@nosql, :source, :find
    def_delegator :@nosql, :get_rid_of, :delete
    def_delegator :@nosql, :query, :all
  end

  class Sqlite3Adapter
    extend Forwardable
    def initialize file
      @sqlite = Sqlite3.new file
    end
    def_delegator :@sqlite, :search, :find
    def_delegator :@sqlite, :remove, :delete
    def_delegator :@sqlite, :look_for_all, :all
  end
end

class MySQL
  def initialize file
  end
  
  def select
  end

  def alter
  end

  def fetch
  end
end

class NoSQL
  def initialize file
  end
  def get_rid_of
  end

  def source
  end

  def query
  end
end

class Sqlite3
  def initialize file
  end

  def remove
  end

  def look_for_all
  end

  def search
  end
end

db = Database.new(file: 'db.database', adapter: :mysql)
db1 = Database.new(file: 'db.database', adapter: :nosql)
db2= Database.new(file: 'db.database', adapter: :sqlite3)
db.find
db1.find
db2.find