module Api
  module V1
    class RepliesController < ApplicationController
      # 特定のメモに返信を新規作成（POST /api/v1/users/:user_id/memos/:memo_id/replies）
      def create
        @user = User.where(uid: params[:user_id]).take
        @memo = @user.memo.find(params[:memo_id])
        @reply = @memo.reply.create(reply_params)

        render json: {status: 200,message: 'user data',data: @reply}
      end

      # 特定のメモの返信を更新（PATCH /api/v1/users/:user_id/memos/:memo_id/replies/:id）
      def update
        @user = User.where(uid: params[:user_id]).take
        @memo = @user.memo.find(params[:memo_id])
        @reply = @memo.reply.find(params[:id])
        @update = @reply.update(reply_params)

        render json: {status: 200,message: 'user data',data: @update}
      end

      # 特定のメモの返信を削除（DELETE /api/v1/users/:user_id/memos/:memo_id/replies/:id）
      def destroy
        @user = User.where(uid: params[:user_id]).take
        @memo = @user.memo.find(params[:memo_id])
        @reply = @memo.reply.find(params[:id])
        @reply.destroy
      
        render json: {status: 200,message: 'user data',data: @reply}
      end

      private
        def reply_params
          params.require(:memo).permit(:body)
        end
    end
  end
end
