module Api
  module V1
    class CommentsController < ApplicationController
      # コメント新規作成（POST /api/v1/users/:user_id/memos/:memo_id/comments）（動作確認済み9/28）
      MAX_RECORD = 100
      def create
        user = User.where(uid: params[:user_id]).take
        memo = user.memo.find(params[:memo_id])
        if memo.comment.count < MAX_RECORD
          comment = memo.comment.create(comment_params)
          render json: {status: 200, message: 'success create comment',data: comment, count: memo.comment.count}
        else
          render json: {status: 500, message: 'record limit reached'}
        end

      end

      # コメント更新（PATCH /api/v1/users/:user_id/memos/:memo_id/comments/:id）（動作確認済み9/28）
      def update
        user = User.where(uid: params[:user_id]).take
        memo = user.memo.find(params[:memo_id])
        comment = memo.comment.find(params[:id])
        comment.update(comment_params)

        render json: {message: 'success update comment' ,data: comment}
      end

      # コメント削除（DELETE /api/v1/users/:user_id/memos/:memo_id/comments/:id）（動作確認済み9/28）(未使用)
      # def destroy
      #   user = User.where(uid: params[:user_id]).take
      #   memo = user.memo.find(params[:memo_id])
      #   comment = memo.comment.find(params[:id])
      #   comment.destroy
      # 
      #   render json: {message: 'success delete comment',data: comment}
      # end

      private
        def comment_params
          params.require(:comment).permit(:body, :createdAt, :updatedAt, :deleted, :deletedAt)
        end
    end
  end
end
