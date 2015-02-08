User.destroy_all
Post.destroy_all
Library.destroy_all

admin = User.create(:name => 'admin', :email => 'admin@admin.com', :password => 'admin', :password_confirmation => 'admin', :is_admin => true)

u1 = User.create(:name => 'tom', :email => 'tom@tom.com', :bio => 'Hi my name is Tom and I live in Sydney.', :image => 'https://thechive.files.wordpress.com/2011/02/derp-idiot-13.jpg', :password => 'tom', :password_confirmation =>'tom')
