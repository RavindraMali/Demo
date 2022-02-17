ActiveAdmin.register Category do
  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :status, :description
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    text_node javascript_include_tag Ckeditor.cdn_url
    f.inputs do
      f.input :name
      f.input :status
      f.input :description, :as => :ckeditor, input_html: { ckeditor: { height: 200 }, style: "margin-left:20%"}
  end
  f.actions
  end

  index do
    id_column
    column :name
    column :description do |category|
      category.description.to_s.html_safe
      end
    column :status
  actions
  end

end
