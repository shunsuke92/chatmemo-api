module Api
  module V1
    class UsersController < ApplicationController
      # ユーザー情報取得（GET /api/v1/users/:id）（動作確認済み）
      def show
        user = User.where(uid: params[:id]).take

        render json: user
      end

      # ユーザー新規作成（POST /api/v1/users）（動作確認済み10/5）
      def create
        if User.exists?(user_params)
          render json: {message: 'already exist'}
        else
          user = User.create(user_params)

          # Settingテーブルの初期設定を追加
          user.create_setting(hide_completed_memo: true,display_comment_date: true)

          render json: {message: 'success create user',data: user}
        end
        
      end

      # ユーザー削除（DELETE /api/v1/users/:id）（動作確認済み10/5）
      def destroy
        user = User.where(uid: params[:id]).take
        user.destroy
      
        render json: {message: 'success delete user',data: user}
      end

      private
        def user_params
          params.require(:user).permit(:uid)
        end
    end
  end
end
