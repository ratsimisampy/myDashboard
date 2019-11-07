class CommentsController < ApplicationController
    http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
        
    def show
        
    end
    
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        

        @comment.user_id = current_user.id
        if @comment.save
            redirect_to article_path(@article)
            puts "commentaire a ete cree !!!!!!"
        else
            flash.now[:danger] = "error"
        end
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comment.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end

    private
    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end
end
