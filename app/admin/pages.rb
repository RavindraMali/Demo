ActiveAdmin.register Page do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :slug, :content, :bannerimage
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :slug, :content]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    id_column
    column :title
    column :slug
    column :content do |page|
        page.content.to_s.html_safe
    end
    column :bannerimage do |page|
      if page.bannerimage_url
      image_tag page.bannerimage_url(:thumb)
      else
        "Not uploaded"
      end
    end
    actions
  end
  show do
    attributes_table do
        row :title
        row :slug
        row :content do |page|
          page.content.to_s.html_safe
        end
        row :bannerimage do |page|
          image_tag page.bannerimage_url
        end
        active_admin_comments
    end
  end
  form do |f|
    text_node javascript_include_tag Ckeditor.cdn_url
    f.inputs do 
      f.input :title
      f.input :slug
      f.input :content, :as => :ckeditor, input_html: { ckeditor: { height: 200 }, style: "margin-left: 20%" }
      f.input :bannerimage
    end
    f.actions
  end

end
