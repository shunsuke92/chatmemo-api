module Api
  module V1
    class MemosController < ApplicationController
      # メモ情報取得（GET /api/v1/users/:user_id/memos）（動作確認済み）
      def index
        # limit,offsetは使用しなくなった
        # limit = params[:limit]
        # offset = params[:offset]
        
        @user = User.where(uid: params[:user_id]).take
        # @memo = @user.memo.includes(:comment).limit(limit.to_i).offset(offset.to_i).reorder("id desc").reverse
        @memo = @user.memo.includes(:comment)

        contents = []
        @memo.each do |m|
          comments = []
          m.comment.each do |c|
            comments.push(c)
          end
          contents.push(m.attributes.merge({"comments" => comments}))
        end

        render json: {contents:contents}
      end

      # メモ新規作成（POST /api/v1/users/:user_id/memos）（動作確認済み9/28）
      MAX_RECORD = 10000
      def create
        user = User.where(uid: params[:user_id]).take

        if user.memo.count < MAX_RECORD
          memo = user.memo.create(memo_params)
          render json: {status: 200, message: 'success create memo', data: memo, count: user.memo.count}
        else
          render json: {status: 500, message: 'record limit reached'}
        end

      end

      # メモ更新（PATCH /api/v1/users/:user_id/memos/:id）（動作確認済み9/28）
      def update
        user = User.where(uid: params[:user_id]).take
        memo = user.memo.find(params[:id])
        memo.update(memo_params)

        render json: {message: 'success update memo' ,data: memo}
      end

      # メモ削除（DELETE /api/v1/users/:user_id/memos/:id）（動作確認済み10/24）
      def destroy
        user = User.where(uid: params[:user_id]).take
        memo = user.memo.find(params[:id])
        memo.destroy
      
        render json: {message: 'success delete memo',data: memo}
      end

      private
        def memo_params
          params.require(:memo).permit(:body, :createdAt, :updatedAt, :completed, :completedAt, :deleted, :deletedAt)
        end
    end
  end
end