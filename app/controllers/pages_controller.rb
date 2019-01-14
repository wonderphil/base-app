class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create_job, raise: false

  def home
    @soical_heading = true
    @cards = Ecard.all.limit(5)
  end

  def about_us
    @job = Job.new
  end

  def privacy
  end

  def create_job
    @job = Job.new job_params
    if @job.valid?
      @job.message = "looking for job"
      MessageMailer.contact(@job).deliver_now
      redirect_to about_us_path
      flash[:success] = "We have received your message and will be in touch soon!"
    else
      flash[:alert] = "There was an error sending your message. Please try again."
      render :about_us
    end
  end

private
  def job_params
    params.require(:job).permit(:name, :email, :speciality, :phone)
  end
end
