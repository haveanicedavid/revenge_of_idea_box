class IdeasController < ApplicationController
  respond_to :json

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    idea = Idea.new(idea_params)
    if idea.save
      respond_with(idea)
    else
      respond_with({:errors => idea.errors }, :status => 422, :location => ideas_path)
    end

    # if idea.save
    #   success = {:message => "Congrats! An idea was created!", :idea => idea}
    #   respond_with(success, :status => 201, :location => idea_path(idea))
    # else
    #   respond_with({:errors => idea.errors }, :status => 422, :location => ideas_path)
    # end
  end
  
  def delete
    @idea = Idea.find(id: params[:id])
    @idea.destroy
  end


  private

    def idea_params
      params.require(:idea).permit(:title, :body, :quality)
    end

end

  # def create
  #   @idea = Idea.new(idea_params)
  #   if @idea.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

