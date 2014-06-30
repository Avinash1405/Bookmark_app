class HomeController < ApplicationController
def homepage
	@bookmarks = Bookmark.order(votes: :desc)

end
def newBookmark
	@bookmark = Bookmark.new
end
def createBookmark
	@bookmark = Bookmark.new
	@bookmark.title = params[:bookmark][:title]
	@bookmark.description = params[:bookmark][:description]
	@bookmark.url = params[:bookmark][:url]
	@bookmark.user = current_user
	unless @bookmark.save
		render "newBookmark"
	end
end
def addVote
	@bookmark = Bookmark.find(params[:id])
	unless UserVote.where(user_id: current_user,bookmark_id: @bookmark).exists?
		@vote = UserVote.new
		@vote.user = current_user
		@vote.bookmark = @bookmark
		if @vote.save
			@bookmark.votes = @bookmark.votes+1
			@bookmark.save
			puts "INSIDE IF IN ADDVOTE"
			render :json => @bookmark.votes
		end
	else
		puts "INSIDE ELSE IN ADDVOTE"
		render :json => 0
	end	
end
def linkTo
	@bookmark = Bookmark.find(params[:id])
	@link = @bookmark.url  
end
def personalBookmark
	@user_id = current_user.id 
	@bookmarks =Bookmark.where(user_id: @user_id)
end
def delete
	@bookmark = Bookmark.find(params[:id])
	@bookmark.delete
	redirect_to home_personalBookmark_path
end
end
