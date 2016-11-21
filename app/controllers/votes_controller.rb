class VotesController < ApplicationController
  def create
    if current_user
      @vote = Vote.new(vote_params)
      @vote.share = Share.find(params["share_id"])
      @vote.user = current_user
      @vote.save
      redirect_to shares_path
    else
      @message = "You must be logged in to vote"
      render new_session_path
    end
  end

  def update
    if current_user
      @vote = Vote.find(params["id"])
      @vote.update!(vote_params)
      redirect_to shares_path
    else
      @message = "You must be logged in to vote"
      render new_session_path
    end
  end

  def vote_params
    params.require(:vote).permit(:value)
  end
end
