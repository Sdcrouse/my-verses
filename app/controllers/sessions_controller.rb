class SessionsController < ApplicationController
  require 'pry'

  def new
    @user = User.new
  end

  def create
    binding.pry
  end

  def destroy
  end
end