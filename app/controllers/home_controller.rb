class HomeController < ApplicationController
  def index
    @posts = Post.all.load_async
  end
end
