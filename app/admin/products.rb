ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :title, :description, :code, :manufacture_by, :status, :price, :quantity, :image
  # text_node javascript_include_tag Ckeditor.cdn_url
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :title, :description, :code, :manufacture_by, :status, :price, :quantity]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end



  form do |f|
    text_node javascript_include_tag Ckeditor.cdn_url
    
    f.inputs do
      f.input :name
      f.input :title
      f.input :description, :as => :ckeditor, input_html: { ckeditor: { height: 200 }, style: "margin-left: 20%" }
      f.input :code
      f.input :manufacture_by
      f.input :status
      f.input :price
      f.input :quantity
      f.input :image
    end
    f.actions
  end
end
