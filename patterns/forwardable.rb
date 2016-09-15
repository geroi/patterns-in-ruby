require 'forwardable'
class SoundCollection
  extend Forwardable
  def initialize collection
    @collection = collection
  end

  def_delegator :@collection, :show_last_and_first, :circled
end

class Collection
  def initialize *collection
    @collection = collection
  end

  def show_last_and_first
    [@collection[-1],@collection[0]]
  end
end

sounds = SoundCollection.new(Collection.new(1,2,3,4,5))
# puts collection.shuffle
puts sounds.circled