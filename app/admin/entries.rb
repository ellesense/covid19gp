ActiveAdmin.register Entry do
  permit_params :created_at, :user_id
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :question_one, :question_two, :question_three, :question_four, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:question_one, :question_two, :question_three, :question_four, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
