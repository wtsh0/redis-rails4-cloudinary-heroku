class Managers::ManagersBase < ApplicationController
  layout 'manager'
  before_action :authenticate_manager!
end
