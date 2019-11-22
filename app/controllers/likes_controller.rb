class LikesController < ApplicationController
    before_action :find_article
    before_action :find_like, only: [:destroy] 
    skip_before_action :verify_authenticity_token

    def create
        if already_liked?
            flash[:notice] = "You can't like more than once"
        else
            @like = @article.likes.create(user_id: current_user.id)
        end
        redirect_to article_path(@article)
        
    end

    def destroy
        if !(already_liked?)
            flash[:notice] = "cannot unlike"
        else
            @like.destroy
        end
        redirect_to article_path(@article)
    end

    def find_like
        @like = @article.likes.find(params[:id])
    end

    private

    def already_liked?
        Like.where(user_id: current_user.id, article_id:
        params[:article_id]).exists?
    end

    def find_article
        @article = Article.find(params[:article_id])
    end
end
