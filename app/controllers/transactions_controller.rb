class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @groups = Group.all
    @transaction = Entity.new
    @category = Group.find(params[:category_id])
  end

  def create
    # p transaction_params
    entity = current_user.entities.create(transaction_params)
    if entity.errors.any?
      flash[:alert] = entity.errors.first.full_message
      @category = Group.find(params[:category_id])
      @groups = Group.all
      render :new
    else
      transaction = EntitiesGroup.new(group_id: params[:category_id], entity_id: entity.id)
      if transaction.save
        redirect_to category_path(params[:category_id]), notice: 'New transaction created successfully.'
      else
        render :new, alert: transaction.errors.first
      end
    end
  end

  private

  def transaction_params
    params.require(:entity).permit(:name, :amount)
  end
end
