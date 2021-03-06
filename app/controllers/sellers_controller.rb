class SellersController < ApplicationController
  def new
    if current_user.nil?
      redirect_to login_path
    elsif current_user.seller.present?
      redirect_to producer_admin_dashboard_path
    end
  end

  def create
    unless current_user.seller.present?
      result = CreateSeller.call(current_user, account_params)
      if result.success?
        flash[:notice] = "Párabens! Sua conta produtor foi criada com sucesso!"
        flash.keep(:notice)
        NotificationMailer.with(user: current_user).admin_new_seller.deliver_later
        head :no_content and return
      end
    end
    
    head :bad_request
  end

  private

    def account_params
      params.require(:account).permit(
        :document_number,
        :birthdate,
        :phone,
        :show_phone,
        :help_email,
        address: [
          :zipcode,
          :address,
          :number,
          :complement,
          :district,
          :city,
          :state
        ],
        company: [
          :name,
          :business_name,
          :document_number,
          address: [
            :zipcode,
            :address,
            :number,
            :complement,
            :district,
            :city,
            :state
          ]
        ]
      )
    end
end
