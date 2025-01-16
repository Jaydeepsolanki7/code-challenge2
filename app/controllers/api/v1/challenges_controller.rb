class Api::V1::ChallengesController < ApplicationController 
  
  before_action :set_challenge, only: %i[show update destroy]
  def index
    @challenges = Challenge.all
    render json: @challenges
  end

  def create
    @challenge = Challenge.new(challenge_params)
    if @challenge.save
      render json: @challenge, status: :created
    else
      render json: @challenge.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @challenge
  end

  def update
    if @challenge.update(challenge_params)
      render json: @challenge
    else
      render json: @challenge.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @challenge.destroy
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end

  def challenge_params
    params.require(:challenge).permit(:title, :description, :start_date, :end_date)
  end
end
