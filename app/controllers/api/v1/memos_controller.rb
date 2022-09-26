module Api
  module V1
    class MemosController < ApplicationController
      # ユーザーの全メモを取得（GET /api/v1/users/:user_id/memos）
      def index
        @user = User.where(uid: params[:user_id]).take
        @memo = @user.memo.all

        @contents = []
        @memo.find_each do |memo|
          @comment = []
          memo.comment.find_each do |comment|
            @comment.push(comment)
          end
          @contents.push(memo.attributes.merge({"comments" => @comment}))
        end

        render json: {contents:@contents}
      end

      # メモ新規作成（POST /api/v1/users/:user_id/memos）
      def create
        @user = User.where(uid: params[:user_id]).take
        @memo = @user.memo.create(memo_params)

        render json: {status: 200,message: 'user data',data: @memo}
      end

      # メモ情報更新（PATCH /api/v1/users/:user_id/memos/:id）
      def update
        @user = User.where(uid: params[:user_id]).take
        @memo = @user.memo.find(params[:id])
        @update = @memo.update(memo_params)

        render json: {status: 200,message: 'user data',data: @update}
      end

      # メモ削除（DELETE /api/v1/users/:user_id/memos/:id）
      def destroy
        @user = User.where(uid: params[:user_id]).take
        @memo = @user.memo.find(params[:id])
        @memo.destroy
      
        render json: {status: 200,message: 'user data',data: @memo}
      end

      private
        def memo_params
          params.require(:memo).permit(:body, :completed, :type)
        end
    end
  end
end