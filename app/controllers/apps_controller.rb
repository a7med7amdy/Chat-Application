class AppsController < ApplicationController
    def index
      @apps = App.all
    end
  
    def new
      @app = App.new
    end
  
    def show
      @app = App.find_by(access_token: params["id"])  # /show (id)
    end
  
    def create
      @app = App.new(app_params)
      if @app.save
        redirect_to action: "index"
      else
        render :new, status: :unprocessable_entity
      end
    end


    def edit
        @app = App.find_by(access_token: params[:id])
    end
    
    def update
        @app = App.find(params[:id])
        if @app.update(app_params)
            redirect_to action: "index"
        else
            render :edit, status: :unprocessable_entity
        end
    end
  
    private
      def app_params
        params.require(:app).permit(:name)
      end
      
  end