User.destroy_all
Post.destroy_all
Library.destroy_all
Image.destroy_all

admin = User.create(:name => 'admin', :email => 'admin@admin.com', :password => 'admin', :image => 'http://www.businesscomputingworld.co.uk/wp-content/uploads/2012/07/Admin-Pet-Peeves.jpg', :password_confirmation => 'admin', :is_admin => true)
admin_lib = Library.create(:user_id => admin.id)


u1 = User.create(:name => 'tom', :email => 'tom@tom.com', :bio => 'Hi my name is Tom and I live in Sydney.', :image => 'https://thechive.files.wordpress.com/2011/02/derp-idiot-13.jpg', :password => 'tom', :password_confirmation =>'tom')
l1 = Library.create(:user_id => u1.id)
p1 = Post.create(:title => 'Black Circle', :description => 'A circle made in CSS.', :codepen => 'http://codepen.io/tomvalorsa/pen/YPErVE', :codepen_embed => 'https://codepen.io/tomvalorsa/embed/YPErVE', :user_id => u1.id)

l1.posts << p1

u2 = User.create(:name => 'matt', :email => 'matt@matt.com', :bio => 'Hi my name is Matt and I live in London.', :image => 'https://thechive.files.wordpress.com/2011/02/derp-idiot-13.jpg', :password => 'matt', :password_confirmation =>'matt')
l2 = Library.create(:user_id => u2.id)
p2 = Post.create(:title => 'Speech Bubble', :description => 'A speech bubble made in CSS.', :codepen => 'http://codepen.io/tomvalorsa/pen/vEWVvr', :codepen_embed => 'http://codepen.io/tomvalorsa/embed/vEWVvr', :user_id => u2.id)

l2.posts << p2

u3 = User.create(:name => 'charlie', :email => 'charlie@charlie.com', :bio => 'Hi my name is Charlie and I live in London.', :image => 'https://thechive.files.wordpress.com/2011/02/derp-idiot-13.jpg', :password => 'charlie', :password_confirmation =>'charlie')
l3 = Library.create(:user_id => u3.id)
p3 = Post.create(:title => 'Triangles', :description => 'Triangles made in CSS.', :codepen => 'http://codepen.io/tomvalorsa/pen/LEOXjJ', :codepen_embed => 'http://codepen.io/tomvalorsa/embed/LEOXjJ', :user_id => u3.id)

l3.posts << p3
