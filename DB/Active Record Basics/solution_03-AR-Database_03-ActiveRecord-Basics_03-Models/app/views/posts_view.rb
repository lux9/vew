class PostsView
  def display(posts)
    posts.each do |post|
      puts "#{post.id}. #{post.title} - #{post.votes} votes - #{post.url}"
    end
  end

  def ask_for(label)
    puts "#{label}?"
    print ">"
    gets.chomp
  end
end
