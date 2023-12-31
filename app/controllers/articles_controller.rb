class ArticlesController < ApplicationController
before_action :set_art, only: [:show, :edit, :update, :destroy]
    def show
    
end

def index
    @art = Article.paginate(page: params[:page], per_page: 3)
end

def new
@art = Article.new
end
def edit 
    
end

def create
@art = Article.new(set_param)
@art.user = User.first
if @art.save
flash[:notice] = "article created!!"
redirect_to @art
else
    render :new, status: :unprocessable_entity
end
end

def update
    if @art.update(set_param)
        flash[:notice] = "article updated!!"
        redirect_to @art
        else
            render :edit, status: :unprocessable_entity
        end
end

def destroy
@art.destroy
redirect_to articles_path
end


def set_art
    @art = Article.find(params[:id])
end

def set_param
    params.require(:article).permit(:title, :description)
end
end
