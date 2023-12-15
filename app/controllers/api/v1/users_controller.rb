class Api::V1::UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :set_user, only: [:informations, :transactions, :add_money_to_balance]

  def informations
    user = set_user
    render json: user, status: 200
  end

  def add_money_to_balance
    user = set_user
    new_balance = user.balance + params[:money_transfered]
    user.update(balance: new_balance)

    render json: { message: "You successfully added #{params[:money_transfered]} to your balance. Now you have #{user.balance}"}, status: 200 
  end

  def transactions
    user = set_user
    render json: user.transactions, status: 200
  end

  private 

  def set_user
    User.find(params[:user_id])
  end

  def record_not_found
    render json: {message: 'Record not found'}, status: 404
  end
end
