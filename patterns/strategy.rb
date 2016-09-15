module Archivator
  def self.compress(file, archive_type: :zip)
    strategy = const_get(archive_type.to_s.capitalize).new(file)
    strategy.compress
  end

class Zip
  def initialize file
    @file = file
  end
  def compress
    algorithm_zip
  end

  def algorithm_zip
    puts 'ZIPped'
  end
end

class Rar
  def initialize file
    @file = file
  end
  def compress
    algorithm_rar
  end
  def algorithm_rar
    puts 'RARred'
  end
end
end

my_file = 'test.txt'
archive = Archivator.compress(my_file, archive_type: :zip)
