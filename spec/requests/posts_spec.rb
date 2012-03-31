require 'spec_helper'
describe "posts" do
  before(:each) do
    user = Factory(:user)
    posts = 0
    published_at = DateTime.now - 30.days
    25.times do
      revisions = 0
      posts += 1
      @post = Factory(:post)
      3.times do 
        revisions += 1
        published_at = published_at + 1.day
        @post.posts_revisions.build(Factory.attributes_for(:posts_revision, user_id: user.id, url: "/monologue/post/#{posts}" , title: "post #{posts} | revision #{revisions}", published_at: published_at))
      end
      @post.save
    end
  end
  
  it "lists posts" do
    visit "/monologue"
    page.should have_content("post 23 | revision 3")
    page.should_not have_content("post 23 | revision 2")
    page.should_not have_content("post 23 | revision 1")
  end
  
  it "should route to a post" do
    visit "/monologue"
    click_on "post 23 | revision 3"
    page.should have_content("this is some text with french accents")
    page.should_not have_content("post 23 | revision 2")
  end
  
  it "has a feed" do
    visit feed_path
    page.should_not have_content("post 23 | revision 2")
    page.should have_content("post 23 | revision 3")
  end
  
  it "should return 404 on non existent post" do
    lambda {
      visit "/monologue/this/is/a/404/url"
    }.should raise_error(ActionController::RoutingError)
  end
end