class UsersController < ApplicationController
  require 'pry'

  def new
    @user = User.new
  end

  # Next step: The #create action.
  def create
    binding.pry
  end
end
