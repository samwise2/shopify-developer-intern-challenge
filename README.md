# Shopify Developer Intern Challenge!
By: Sam Orend

## Summary

## Get Started

I developed my developer intern challenge as a Rails application, since Shopify is the largest Rails app in the world!

Here's how you can get started:

1. `git clone https://github.com/samwise2/shopify-developer-intern-challenge.git`
2. `cd shopify-developer-intern-challenge/image-repo`

I recommend using a ruby version manager to install the correct ruby version that this application will need. This example will use [rbenv](https://github.com/rbenv/rbenv).

Rbenv installation:
a. Install Homebrew if needed (`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`)
b. Confirm with `brew --version`
c. Install rbenv `brew install rbenv`
d. Check installation with `rbenv --version`

3. Install Ruby 2.7.3 with rbenv `rbenv install 2.7.3`
4. Use Ruby 2.7.3 to run the application `rbenv global 2.7.3` or `rbenv local 2.7.3`
5. `gem install bundler -v 2.1.4` if you don't already have bundler (you can check with bundler --version)
6. Run `bundle` to install necessary gems
7. `yarn` to install JavaScript dependencies. (`brew install yarn`) if you don't already have it.
8. `bundle e rails db:setup`
9. `bundle e rails db:migrate` (should be a no-op, but safe)
10. `bundle e rails s`

Now you can visit `http://localhost:3000/graphics` to get started!
