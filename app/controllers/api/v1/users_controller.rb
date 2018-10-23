module Api
  module V1
    class UsersController < ApplicationController
      # skip_before_action :authorized, only: [:create]

      def index
        @users = User.all
        render json: @users
      end

      def create
        user = User.create(name: params[:name], email: params[:email], password: params[:password])
        if user.save
          token = encode_token({ user_id: user.id })
          render json: { user: user, jwt: token}
        end
      end

      def show
      end

      def destroy
      end

    end
  end
end
