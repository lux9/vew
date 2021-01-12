require_relative "../views/posts_view"

class PostsController
  def initialize
    @view = PostsView.new
  end

  def index
    display_posts
  end

  def create
    title = @view.ask_for(:title)
    url = @view.ask_for(:url)
    post = Post.create(title: title, url: url)
    display_posts
  end

  def update
    id = ask_for_id
    title = @view.ask_for(:title)
    url = @view.ask_for(:url)
    post = Post.find(id)
    post.update(title: title, url: url)
    display_posts
  end

  def destroy
    id = ask_for_id
    Post.destroy(id)
    display_posts
  end

  def upvote
    id = ask_for_id
    post = Post.find(id)
    post.update(votes: post.votes + 1)
    display_posts
  end

  private

  def display_posts
    posts = Post.all
    @view.display(posts)
  end

  def ask_for_id
    display_posts
    @view.ask_for(:id).to_i
  end
end
