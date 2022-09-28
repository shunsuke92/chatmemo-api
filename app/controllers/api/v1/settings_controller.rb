module Api
  module V1
    class SettingsController < ApplicationController
      # ユーザーの設定情報を取得（GET /api/v1/users/:user_id/settings）
      def index
        @user = User.where(uid: params[:user_id]).take
        @setting = @user.setting

        render json: @setting
      end
    end
  end
end