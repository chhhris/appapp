class InterviewController < ApplicationController


  def show
    @dossier = Dossier.find(params[:id])
    @user = @dossier.user
  end

  def claim
    @dossier = Dossier.find(params[:id])
    Interview.create(user: current_user, dossier: @dossier, :stage => @dossier.aasm_state)

    if @dossier.needs_interview?
      UserMailer.interview_email(@dossier.user).deliver
    elsif @dossier.needs_code_interview?
      UserMailer.code_email(@dossier.user).deliver
    else
      puts "what?"
    end
    redirect_to :back
  end

  def new
    @days = Date.tomorrow..(Date.tomorrow+6.day)
  end

  def create
    raise params.inspect
  end
  
end
