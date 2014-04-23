class HomeController < ApplicationController
  def index
    @menus = Menu.all
    @users = User.all
  end
end
