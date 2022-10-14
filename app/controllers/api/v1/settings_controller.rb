module Api
  module V1
    class SettingsController < ApplicationController
      # 設定情報取得（GET /api/v1/users/:user_id/settings）（動作確認済み10/5）
      def index
        user = User.where(uid: params[:user_id]).take
        setting = user.setting

        render json: {contents: setting}
      end

      # 設定更新（PATCH /api/v1/users/:user_id/settings/:id）（動作確認済み10/5）
      def update
        user = User.where(uid: params[:user_id]).take
        user.setting.update(setting_params)

        render json: {message: 'success update setting' ,data: user.setting}
      end

      private
        def setting_params
          params.require(:setting).permit(:hide_completed_memo, :display_comment_date, :dark_mode)
        end
    end
  end
end