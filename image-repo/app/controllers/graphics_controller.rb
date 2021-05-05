class GraphicsController < ApplicationController
    def create
        graphic_params = params.require(:graphic).permit(:title, :description, :image)
        @graphic = Graphic.new(graphic_params)
        #@graphic = Graphic.new
        #@graphic.title = params[:graphic][:title]
        #@graphic.description = params[:graphic][:description]
        #@graphic.image.attach(params[:graphic][:image])
        respond_to do |format|
            if @graphic.save
              format.html  { redirect_to(@graphic, :notice => 'Graphic was successfully created.') }
              format.json  { render :json => @graphic, :status => :created, :location => @graphic }
            else
              format.html  { render :action => "new" }
              format.json  { render :json => @post.errors, :status => :unprocessable_entity }
            end
        end
    end
    def new
        @graphic = Graphic.new
        respond_to do |format|
            format.html  # new.html.erb
            format.json  { render :json => @graphic }
        end
    end
    def show
        @graphic = Graphic.find(params[:id])
    end
    def index
        @graphics = Graphic.all
    end
end
