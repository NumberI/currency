class AdminController < ApplicationController
  def new
    Rate.exists?(2) ? @rate = Rate.find(2) : @rate = Rate.new
    # @errors = @rate.errors.full_messages
  end

  def update
    @rate = Rate.where(id: 2).first_or_create(name: "Доллар США", fixed_till: Time.parse(rate_params[:fixed_till]), val: rate_params[:val]).update(name: "Доллар США", fixed_till: Time.parse(rate_params[:fixed_till]), val: rate_params[:val])
    if @rate
      redirect_to root_path
    else 
      respond_to do |format|
        format.html {
          flash[:error] = 'Не прошло валидацию'
          flash.keep
          # render action: 'new'
          redirect_to admin_path
        }
      end
    end  
  end

  private
  def rate_params
    params.require(:rate).permit(:fixed_till, :val)
  end

end