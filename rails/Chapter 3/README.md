# Mostly Static Page
## Sample app setup
Generating a new sample app
```bash
cd ~/Workspace/Ruby-Tutorial/rails
rails new sample_app --skip-bundle
cd sample_app/
```
The `--skip-bundle` option skips the installation of the packages needed for 
using JavaScript with Rails. We will install these packages by hand in Chapter 8.

`bundle install`\
To install and include the gems specified in the `Gemfile`.
```bash
bundle config set --local without 'production'
bundle install
```
> `--local without production` is a "remembered option", which means it will be
> included automatically the next time we run `bundle install`

Migrate the database
```rb
rails db:migrate
```

Run the test suite to verify that everything is working correctly:
```rb
rails test
```

### Hello World
```rb
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base

    def hello
        render html: "hello, world"
    end

end

# config/routes.rb
Rails.application.routes.draw do
    root "application#hello"
end
```

## Static Pages