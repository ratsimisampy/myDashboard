class ArticlesController < ApplicationController
    before_action :require_login, except: [:index, :show]
    
    
    def index   
        @articles = Article.all
    end
    
    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
      end

    def show
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(article_params)

        if @article.save
          flash[:success] = "You, registered as '#{current_user.id}' have successfully create a new article titled: #{@article.title}."
        redirect_to @article
        else
          flash.now[:error] = "Article creation has failed for #{@article.title}"
            render 'new'
        end
    end

    def update
        @article = Article.find(params[:id])
       
        if @article.update(article_params)
          flash[:success] = "Your new article have been successfully updated for #{@article.title}."
          redirect_to @article
        else
          flash.now[:error] = "article updating has failed for #{@article.title}."
          render 'edit'
        end
      end


    def destroy
        @article = Article.find(params[:id])
        @article.destroy
   
        redirect_to articles_path
    end

    private
  def article_params
    params.require(:article).permit(:title, :text)
  end

  def require_login
    unless user_signed_in?
      puts "hello, i am in require_login def"
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_user_session_path
    end
  end
end
