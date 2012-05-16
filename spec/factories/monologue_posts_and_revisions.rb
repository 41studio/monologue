# encoding: UTF-8
FactoryGirl.define do
  factory :post, :class => Monologue::Post do
    published true
  end

  factory :posts_revision, :class => Monologue::PostsRevision do
    sequence(:title) { |i| "post #{i} | revision 1" }
    content "this is some text with french accents éàöûù and so on...even html tags like <br />"
    sequence(:url) { |i| "/monologue/post/#{i}" }
    association :user
    association :post
    sequence(:published_at) { |i| DateTime.new(2012, 1, 1, 12, 0, 17) + i.days }
  end

  factory :unpublished_post, :class => Monologue::Post, :parent => :post do |post|
    published false
    post.after_create { |p| Factory(:posts_revision, :post => p, :title => "unpublished", :url => "/monologue/unpublished") }
  end

  factory :post_with_multiple_revisions, :class => Monologue::Post, :parent => :post do |post|
    post.after_create { |p| Factory(:posts_revision, :post => p, :title => "post X | revision 1", :url => "/monologue/post/x") }
    post.after_create { |p| Factory(:posts_revision, :post => p, :title => "post X | revision 2", :url => "/monologue/post/x") }
  end

  factory :post_with_tags, :class => Monologue::Post, :parent => :post_with_multiple_revisions do |post|
    tag = Monologue::Tag.find_or_create_by_name("rails")
    post.after_create { |p| p.posts_revisions.first().tags<<tag }
  end

end