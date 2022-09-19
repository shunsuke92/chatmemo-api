module Api
  module V1
    class UsersController < ApplicationController
      # 全ユーザーを取得（GET /api/v1/users）（**** 不要 ****）
      def index
        @user = User.all
        render json: {status: 200,message: 'user data',data: @user}
      end

      # 指定ユーザーの情報取得（GET /api/v1/users/:id）（動作確認済み）
      # :idにはuidを指定
      def show
        @user = User.where(uid: params[:id]).take

        render json: @user
      end

      # ユーザー新規作成（POST /api/v1/users）（動作確認済み）
      def create
        @user = User.new(user_params)

        # 存在チェック（登録済みのユーザーは登録しない）
        @exist = User.where(uid: user_params[:uid]).take
        if @exist == nil
          if @user.save
            render json: @user
          else
            render json: @user.errors
          end
        else 
          render json: @user
        end
        
      end

      # ユーザー情報更新（PATCH /api/v1/users/:id）（**** 不要 ****）
      # :idにはuidを指定
      def update
        @user = User.where(uid: params[:id]).take

        if @user.update(article_params)
          render json: {status: 200,message: 'user data',data: @user}
        else
          render json: {status: 500,message: 'user data',data: @user.errors}
        end
      end

      # ユーザー削除（DELETE /api/v1/users/:id）
      def destroy
        @user = User.where(uid: params[:id]).take
        @user.destroy
      
        render json: {status: 200,message: 'user data',data: @user}
      end

      private
        def user_params
          params.require(:user).permit(:uid)
        end
    end
  end
end
