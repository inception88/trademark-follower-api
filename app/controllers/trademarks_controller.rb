class TrademarksController < ApplicationController
  before_action :require_login
  
    def index
      @user = session_user
      trademarks = @user.trademarks
      render json: trademarks
    end
  
    def create
      puts params[:serialNumber]
      @user = session_user
      if Trademark.find_by(serialNumber: params[:serialNumber])
        trademark = Trademark.find_by(serialNumber: params[:serialNumber])
      else
        trademark = Trademark.create(trademark_param)
      end
      if Follow.find_by(user_id: @user.id, trademark_id: trademark.id)
      else
        Follow.create(user_id: @user.id, trademark_id: trademark.id)
      end
      render json: trademark
    end
  
    def destroy
      puts params
      @user = session_user
      trademark = Trademark.find(params[:id])
      follow = Follow.find_by(user_id: @user.id, trademark_id: trademark.id)
      if follow
        follow.destroy
      end
      if trademark.follows.length < 1
        puts trademark.follows.length
        trademark.destroy
      end
      render json: trademark
    end
    
    private
      def trademark_param
        params.require(:trademark).permit(:id, :mark, :serialNumber)
      end
  end
