=begin
object = Database.retrieve_object_or_nil || NullObject.new
В случае, если первое выражение выдает nil, то исполняется вторая часть - создается специальный NullObject
Применяется при работе с нил и установке стандартных значений
=end

class Post
  def initialize id, title, body, created_at
    @id, @title, @body, @created_at = id, title, body, created_at
  end

  def self.find_and_publish id
    post = POSTS.find {|post| post.id == id } || NullPost.new # если объект нащелся, то возвращается объект, если нет - нулевой объект, с аналогичным методом, который вызывается позже
    post.publish
  end

  def publish
    @published = true
  end
end

class NullPost
  def publish
    #pusto
  end
end

POSTS = [
  Post.new(
    1,
    "Introduce null object pattern",
    "Post body should go here",
    Time.new(2015,01,02)
    )
]