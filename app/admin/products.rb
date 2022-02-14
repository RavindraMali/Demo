ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :title, :description, :code, :manufacture_by, :status, :price, :quantity
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :title, :description, :code, :manufacture_by, :status, :price, :quantity]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
