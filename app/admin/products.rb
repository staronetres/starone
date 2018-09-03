ActiveAdmin.register Product do

permit_params :title, :description, :image, :price, :category_id, :sale, :subtitle, :tool_ids


index do
    selectable_column
    id_column
    column :title
    column :description
    column :image
    column :price
#      column :categories do |product|
#     table_for post.categories.order('title ASC') do
#       column do |category|
#         link_to category.title, [ :admin, category ]
#       end
#     end
# end
    column :sale
    column :subtitle
    actions
  end



form do |f|
   inputs 'Product' do
     input :title
     input :description
     input :image
     input :price
    
     # input :category, as: :check_boxes, collection: proc { Category.all }
     # input :category_id, collection: Category.all.collect {|x| [x.name, x.id]}
     input :sale
     input :subtitle
     input :tool_ids, collection: Tool.all.collect {|x| [x.name, x.id]}
    end
   f.actions
end







   
end
