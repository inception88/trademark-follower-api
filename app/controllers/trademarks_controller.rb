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
  
    def update
      trademark = Trademark.find(params[:id])
      trademark.update_attributes(trademark_param)
      render json: trademark
    end
  
    def destroy
      trademark = Trademark.find(params[:id])
      trademark.destroy
      head :no_content, status: :ok
    end
    
    private
      def trademark_param
        params.require(:trademark).permit(:mark, :serialNumber)
      end
  end
