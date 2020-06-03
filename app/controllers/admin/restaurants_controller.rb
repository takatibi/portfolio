class Admin::RestaurantsController < ApplicationController
	before_action :if_not_admin
end
