class GymsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def index
    render json: Gym.all, status: :ok
  end

  def show
    gym = find_gym
    render json: gym, status: :ok
  end

  def update
    gym = find_gym
    gym.update!(gym_params)
    render json: gym, status: :accepted
  end

  def destroy
    gym = find_gym
    gym.destroy
    render json: '{}', status: :gone
  end

  private

  def find_gym
    Gym.find(params[:id])
  end

  def gym_params
    params.permit(:name, :address)
  end

  def render_not_found
    render json: { error: 'gym not found' }, status: :not_found
  end

  def render_unprocessable_entity(invalid)
    render json: {
             errors: invalid.record.errors.full_messages,
           },
           status: :unprocessable_entity
  end
end
