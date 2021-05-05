class GraphicsController < ApplicationController
    def create
        graphic_params = check_graphic_params
        @graphic = Graphic.new(graphic_params)
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
        if !params[:query].blank?
            first = Graphic.where("title like ?", "%#{params[:query]}%")
            second = Graphic.where("description like ?", "%#{params[:query]}%").where("title not like ?", "%#{params[:query]}%")
            @graphics = first + second
        else
            @graphics = Graphic.all
        end
    end

    def edit
        @graphic_to_edit = Graphic.find(params[:id])
    end
    
    def update
        graphic_params = check_graphic_params
        Graphic.update(params[:id], graphic_params)
        redirect_to action: "show", id: params[:id]
    end

    private 

    def check_graphic_params
        return params.require(:graphic).permit(:title, :description, :image)
    end
end
