class UsersController < ApplicationController
  expose :users
  expose :user, attributes: :user_params

  def create
    user.save!
    # WebsocketRails[:users].trigger 'create', user
    # WebsocketRails[:diffusions].trigger 'diffusions.new', {test: self.id}.to_json
  end

  def update
    user.save!
  end

  def destroy
    user.destroy
    head 200
  end

  def user_params
    params.require(:user).permit :name
  end
end