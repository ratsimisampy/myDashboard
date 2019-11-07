class LikesController < ApplicationController
    before_action :find_article 
    
    def create
        @like = @article.likes.create(user_id: current_user.id)
        redirect_to article_path(@article)
    end

    private

    def find_article
        @article = @article.find(params[:article_id])
    end
end
