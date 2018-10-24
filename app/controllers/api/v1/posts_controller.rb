module Api
  module V1
    class PostsController < ApplicationController
      def index
        @user = current_user
        @posts = @user.posts
        render json: @posts
      end

      def show
        @post = Post.find(params["id"])
        render json: @post
      end

      def destroy
        @post = Post.find(params["id"])
        @post.destroy
      end

      def create
        # binding.pry
        @post = Post.create(title: params[:title], body: params[:body], user_id: current_user.id)
        render json: @post
      end

      def likes
        @post = Post.find(params["post"]["id"])
        @post.likes = params["likes"] + 1
        @post.save
        render json: @post
      end

    end
  end
end
