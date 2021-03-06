class ArticlesController < ApplicationController
    before_action :require_login, except: [:index, :show]
    
    
    def index   
        @articles = Article.all
        @users = User.all 
        comments = Comment.all
        @comments_by_article = Comment.all.group_by(&:article_id)
        #binding.pry
    end
    
    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
      end

    def show
        @article = Article.find(params[:id])
        @users = User.all
       # @comment_autor = @article.comment.find(params[:id]).user_id
       # binding.pry
    end

    def create
        @article = current_user.articles.build(article_params)
        
        if @article.save
          #flash[:success] = "You, registered as '#{current_user.id}' have successfully create a new article titled: #{@article.title}."
          flash[:success] = t('articles.create.success', :title => @article.title)
        redirect_to @article
        else
          #flash.now[:error] = "Article creation has failed for #{@article.title}"
          flash.now[:error] = t('articles.create.failed')
            render 'new'
        end
    end

    def update
        @article = Article.find(params[:id])
       
        if @article.update(article_params)
          #flash[:success] = "Your new article have been successfully updated for #{@article.title}."
          flash[:success] = t('articles.update.success', :title => @article.title)
          redirect_to @article
        else
          #flash.now[:error] = "article updating has failed for #{@article.title}."
          flash.now[:error] = t('articles.update.failed', :title => @article.title)
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
    params.require(:article).permit(:title, :text, :user_id)
  end

  def require_login
    unless user_signed_in?
      puts "hello, i am in require_login def"
      #flash[:error] = "You must be logged in to access this section"
      flash[:error] = t('articles.login')
      redirect_to new_user_session_path
    end
  end
end
