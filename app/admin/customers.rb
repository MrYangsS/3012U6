ActiveAdmin.register Customer do
  # 允许的参数列表
  permit_params :full_name, :phone_number, :email_address, :notes, :image

  # 控制索引页上显示的列
  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email_address
    column :notes
    column 'Image' do |customer|
      if customer.image.attached?
        image_tag url_for(customer.image), width: 60, height: 60
      else
        'No Image'
      end
    end
    actions
  end

  # 过滤器
  filter :full_name
  filter :phone_number
  filter :email_address

  # 控制表单的布局
  form do |f|
    f.inputs 'Customer Details' do
      f.input :full_name
      f.input :phone_number
      f.input :email_address
      f.input :notes
      f.input :image, as: :file, hint: f.object.image.attached? ? image_tag(url_for(f.object.image), width: 100, height: 100) : content_tag(:span, "No image uploaded")
    end
    f.actions
  end

  # 控制显示页的布局
  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email_address
      row :notes
      row :image do |customer|
        if customer.image.attached?
          image_tag url_for(customer.image), width: 200, height: 200
        else
          'No Image'
        end
      end
    end
  end
end
