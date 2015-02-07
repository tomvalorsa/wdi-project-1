User.destroy_all
Post.destroy_all
Library.destroy_all

admin = User.create(:name => 'admin', :email => 'admin@admin.com', :password => 'admin', :password_confirmation => 'admin', :is_admin => true)
