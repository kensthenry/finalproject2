class CommentsController < ApplicationController
  before_action :initialize_session
  
        def new
          @comment = Comment.new
        end
      
        def edit
          @comment = Comment.find(params[:id])
            redirect_to product_path
        end
    
        def update
          @comment = Comment.find(params[:id])
            if @comment.update(comment_params)
              redirect_to @comment
            else
              render :edit, status: :unprocessable_entity
            end
            
            message = "You've not submitted any comments!"
            redirect_to product_path, notice: message
          
        end

        private
          def comment_params
            params.require(:comment).permit(:commenter, :body)
          end
end
