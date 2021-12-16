class ClientsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def index
    render json: Client.all, status: :ok
  end

  def show
    client = find_client
    render json: client, methods: [:total_amount], status: :ok
  end

  def update
    client = find_client
    client.update!(client_params)
    render json: client, status: :accepted
  end

  private

  def find_client
    Client.find(params[:id])
  end

  def client_params
    params.permit(:name, :age)
  end

  def render_not_found
    render json: { error: 'client not found' }, status: :not_found
  end

  def render_unprocessable_entity(invalid)
    render json: {
             errors: invalid.record.errors.full_messages,
           },
           status: :unprocessable_entity
  end
end
