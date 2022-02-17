ActiveAdmin.register Product do
  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :title, :description, :code, :manufacture_by, :status, :price, :quantity, :image, :category_id
  # text_node javascript_include_tag Ckeditor.cdn_url
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :title, :description, :code, :manufacture_by, :status, :price, :quantity]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do  
      id_column
      column :name
      column :title
      column :description do |product|
        product.description.to_s.html_safe
      end
      column :code
      column :manufacture_by
      column :status
      column :price
      column :quantity
      column :image do |product|
        if product.image_url
        image_tag product.image_url(:thumb)
        else
          "Not uploaded"
        end
      end
      column :category_id do |product|
        if product.category_id.present?
          product.category_id
        end
      end
      actions
  end

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
      f.input :category  # don't use category_id 
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :title
      row :description do |product|
        product.description.to_s.html_safe
      end
      row :code
      row :manufacture_by
      row :status
      row :price
      row :quantity
      row :image do |product|
        if product.image.present?
        image_tag product.image.url
        end
      end
      row :category_id do |product|
        if product.category_id.present?
          product.category_id
        end
      end
    end
    active_admin_comments
  end



end
