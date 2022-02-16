ActiveAdmin.register Page do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :slug, :content
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
    actions
  end
  
  form do |f|
    text_node javascript_include_tag Ckeditor.cdn_url
    f.inputs do 
      f.input :title
      f.input :slug
      f.input :content, :as => :ckeditor, input_html: { ckeditor: { height: 200 }, style: "margin-left: 20%" }
    end
    f.actions
  end

end
