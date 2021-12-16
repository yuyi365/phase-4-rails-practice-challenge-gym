class MembershipsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

  def create
    membership = Membership.create!(membership_params)
    render json: membership, status: :created
  end

  private

  def memebership_params
    params.permit(:client_id, :gym_id, :charge)
  end

  def render_unprocessable_entity(invalid)
    render json: {
             errors: invalid.record.errors.full_messages,
           },
           status: :unprocessable_entity
  end
end
