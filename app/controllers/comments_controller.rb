class CommentsController < ApplicationController
    before_action :get_post, only: [:create]
    
    def create 
     @comment = @post.comments.create(user_id: params[:user_id], body: params[:body])
     respond_to do |format|
        format.turbo_stream do
         render turbo_stream: turbo_stream.replace(
            "post#{@post.id}comments",
            partial: "posts/post_comments",
            locals: {post: @post}
        )
        end
     end
    end

    def destroy
     @comment = Comment.find_by(id: params[:id])
     if @comment.destroy
        respond_to do |format|
            format.turbo_stream do
                render turbo_stream: turbo_stream.remove(
                    "post#{@comment.post_id}ModalComment#{@comment.id}"
                )
            end
        end
     end
    end
    
    private 
    
    def get_post
        @post = Post.find(params[:post_id])
    end


end