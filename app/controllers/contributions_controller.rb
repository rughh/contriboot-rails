class ContributionsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @show_contrib_button = true
    @show_contrib_form = false
    @contributions = Contribution.contributions
    @interests = Contribution.interests
    @contribution = Contribution.new(contribution_type: 'contribution')
  end

  def create
    @contribution = current_user.contributions.build(contribution_params)
    if @contribution.save
      redirect_to contributions_path, notice: 'Thanks for your contribution!'
    else
      @contributions = Contribution.contributions
      @interests = Contribution.interests
      @show_contrib_form = true
      render :index
    end
  end

  def update
    @contribution = current_user.contributions.find(params[:id])
    if @contribution.update(contribution_params)
      redirect_to contributions_path, notice: 'Updated!'
    else
      render :edit
    end
  end

  def edit
    @contribution = current_user.contributions.find(params[:id])
  end

  def toggle_vote
    @contribution = Contribution.find(params[:id])
    if @contribution.voters.exists?(current_user.id)
      @contribution.voters.destroy(current_user)
    else
      @contribution.voters << current_user
    end
    redirect_to contributions_path
  end

  private

  def contribution_params
    params.require(:contribution).permit(:title, :description, :contribution_type)
  end
end
