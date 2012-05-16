# MONOLOGUE
---
Monologue is a basic mountable blogging engine in Rails built to be easily mounted in an already existing Rails app, but it can also be used alone.

[![Build Status](https://secure.travis-ci.org/jipiboily/monologue.png)](http://travis-ci.org/jipiboily/monologue)


## Features
---
- Rails mountable engine (fully named spaced)
- tested
- back to basics: few features
- it has post revisions (no UI to choose published revision yet, but it keeps your modification history)
- few external dependencies (no Devise or Sorcery, etc…) so we don't face problem integrating with existing Rails app.([Rails mountable engines: dependency nightmare?](http://jipiboily.com/2012/rails-mountable-engines-dependency-nightmare))
- comments handled by disqus
- enforcing [Rails cache](http://edgeguides.rubyonrails.org/caching_with_rails.html) for better performance (only support file store for now)
- runs on Heroku

### missing features
- categories
- UI for posts revisions and to manage user
- much more…see issues!


## Installation
---
1. add gem to your `Gemfile`

	    gem "monologue"    
2. run

		$ bundle install
3. add this to your route file (`config/route.rb`)
  
  		mount Monologue::Engine, :at => '/' # or whatever path, be it "/blog" or "/monologue"
  		
4. run

		bundle exec rake monologue:install:migrations
		bundle exec rake db:create # only if this is a new project
		bundle exec rake db:migrate
		
5. Create a user

	  	rails c
	  	Monologue::User.create(name: "monologue", email:"monologue@example.com", password:"my-password", password_confirmation: "my-password")
	  	
6. Configure Monologue. This is all done in an initializer file, say `config/initializers/monologue.rb`. More on this in the [Wiki - Configuration](https://github.com/jipiboily/monologue/wiki/Configuration).

7. Start your server and head on [http://localhost:3000/monologue](http://localhost:3000/monologue) to log in the admin section.

### Note to Heroku users 
Additionnal step: turn caching off in `config/environments/production.rb`: 
```ruby
config.action_controller.perform_caching = true
```

## Enable caching
---
Just turn perform_caching to true in your environment config file (`config/environment/{environment}.rb):
    
    config.action_controller.perform_caching = true
    
**IMPORTANT**: if monologue is mounted at root ("/"), you must also add that in your `routes.rb` file, before the monologue mount:

	root :to => 'monologue/posts#index'

## Customization
---

See the [Wiki - Customizations](https://github.com/jipiboily/monologue/wiki/Customizations).

## Requirements
---
- Rails 3.1 +
- Database: MySQL & Postgres are supported but other databases might work too.

## Contribute
---

Fork it, then pull request. Please add tests for your feature or bug fix.