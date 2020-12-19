class FollowsController < ApplicationController
    def create
        follow = Follow.create(follow_param)
        render json: follow
    end

    def destroy
        follow = Follow.find(params[:id])
        follow.destroy
        head :no_content, status: :ok
    end

    private
    def follow_param
        params.require(:follow).permit(:user_id, :trademark_id)
    end
end
