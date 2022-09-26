module Api
  module V1
    class CommentsController < ApplicationController
      # 特定のメモに返信を新規作成（POST /api/v1/users/:user_id/memos/:memo_id/comments）
      def create
        @user = User.where(uid: params[:user_id]).take
        @memo = @user.memo.find(params[:memo_id])
        @comment = @memo.comment.create(comment_params)

        render json: {status: 200,message: 'user data',data: @comment}
      end

      # 特定のメモの返信を更新（PATCH /api/v1/users/:user_id/memos/:memo_id/comments/:id）
      def update
        @user = User.where(uid: params[:user_id]).take
        @memo = @user.memo.find(params[:memo_id])
        @comment = @memo.comment.find(params[:id])
        @update = @comment.update(comment_params)

        render json: {status: 200,message: 'user data',data: @update}
      end

      # 特定のメモの返信を削除（DELETE /api/v1/users/:user_id/memos/:memo_id/comments/:id）
      def destroy
        @user = User.where(uid: params[:user_id]).take
        @memo = @user.memo.find(params[:memo_id])
        @comment = @memo.comment.find(params[:id])
        @comment.destroy
      
        render json: {status: 200,message: 'user data',data: @comment}
      end

      private
        def comment_params
          params.require(:memo).permit(:body)
        end
    end
  end
end
