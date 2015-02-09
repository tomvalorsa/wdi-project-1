User.destroy_all
Post.destroy_all
Library.destroy_all

admin = User.create(:name => 'admin', :email => 'admin@admin.com', :password => 'admin', :image => 'http://www.businesscomputingworld.co.uk/wp-content/uploads/2012/07/Admin-Pet-Peeves.jpg', :password_confirmation => 'admin', :is_admin => true)
admin_lib = Library.create(:user_id => admin.id)


u1 = User.create(:name => 'tom', :email => 'tom@tom.com', :bio => 'Hi my name is Tom and I live in Sydney.', :image => 'https://thechive.files.wordpress.com/2011/02/derp-idiot-13.jpg', :password => 'tom', :password_confirmation =>'tom')
l1 = Library.create(:user_id => u1.id)
p1 = Post.create(:title => 'Black Circle', :description => 'A circle made in CSS.', :codepen => 'http://codepen.io/tomvalorsa/embed/YPErVE', :user_id => u1.id)

l1.posts << p1