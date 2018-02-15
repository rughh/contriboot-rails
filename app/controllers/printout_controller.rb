class PrintoutController < ApplicationController
  def index
    @contributions = Contribution.contributions
    @interests = Contribution.interests
    respond_to do |format|
      format.pdf
    end
  end
end
