class TrademarksController < ApplicationController
    def index
      trademarks = Trademark.order("created_at DESC")
      render json: trademarks
    end
  
    def create
      trademark = Trademark.create(trademark_param)
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
        params.require(:trademark).permit(:title, :done)
      end
  end
