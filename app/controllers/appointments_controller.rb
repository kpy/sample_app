class AppointmentsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: [:destroy, :edit, :update]

  def create
  	@appointment = current_user.appointments.build(params[:appointment])
  	if @appointment.save
  	  flash[:success] = "Appointment created"
  	  redirect_to root_url
  	else
  	  render 'static_pages/home'
  	end
  end

  def destroy
  	@appointment.destroy
  	redirect_to root_url
  end

  def edit
  	@appointment = Appointment.find(params[:id])
  end

  def update
  	if @appointment.update_attributes(params[:appointment])
      flash[:success] = "Appointment updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  	def correct_user
  	  @appointment = current_user.appointments.find_by_id(params[:id])
  	  redirect_to root_url if @appointment.nil?
  	end
end