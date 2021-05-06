# Shopify Developer Intern Challenge!
By: Sam Orend

## Summary

For my developer intern challenge I made a shutterstock-esque application.

My app allows users to:
- Create a `Graphic`
  - A `Graphic` consists of an image file uploaded from their computer, and a title and description given by the user
- Edit a `Graphic`
  - Users can modify the title and descriptions that they give their `Graphics`
- View all `Graphics`
- Search for `Graphics` and view a list of `Graphics` sorted by relevance   

## Get Started

I developed my developer intern challenge application with Ruby on Rails because Shopify is the largest Rails app in the world, and Rails is awesome for fast-paced development! 

Here's how you can get started:

1. `git clone https://github.com/samwise2/shopify-developer-intern-challenge.git`
2. `cd shopify-developer-intern-challenge/image-repo`

I recommend using a ruby version manager to install the correct ruby version that this application will need. This example will use [rbenv](https://github.com/rbenv/rbenv).

Rbenv installation:
a. Install Homebrew if needed (`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`)
b. Confirm that the installation worked with `brew --version`
c. Install rbenv `brew install rbenv`
d. Confirm that the installation worked with `rbenv --version`

3. Install Ruby 2.7.3 with rbenv `rbenv install 2.7.3`
4. Use Ruby 2.7.3 to run the application `rbenv global 2.7.3` or `rbenv local 2.7.3`
5. `gem install bundler -v 2.1.4` if you don't already have bundler (you can check with bundler --version)
6. Run `bundle` to install necessary gems
7. `yarn` to install JavaScript dependencies. (`brew install yarn`) if you don't already have it.
8. `bundle e rails db:setup`
9. `bundle e rails db:migrate` (should be a no-op, but will ensure that there are no pending migrations)
10. `bundle e rails s`

Now you can visit `http://localhost:3000/graphics` to get started!

## Usage

To create a new graphic you can visit: `localhost:3000/graphics/new`

This will allow you to specify a title and description for the graphic.
<img width="486" alt="Screen Shot 2021-05-06 at 5 37 09 PM" src="https://user-images.githubusercontent.com/24325294/117368561-b1b74100-ae91-11eb-8732-f3a7f4ec0632.png">

And you can upload the image here. There are protections built in to only allow users to create graphics when all fields are specified and the file is a valid image type.
<img width="1164" alt="Screen Shot 2021-05-06 at 5 36 42 PM" src="https://user-images.githubusercontent.com/24325294/117368519-a401bb80-ae91-11eb-8e75-237db962e826.png">

To view the graphic you created you can visit: `localhost:3000/graphics/1`.
<img width="648" alt="Screen Shot 2021-05-06 at 5 39 46 PM" src="https://user-images.githubusercontent.com/24325294/117368841-0eb2f700-ae92-11eb-93f3-e36190a47d97.png">

To view all graphics you have uploaded you can visit `localhost:3000/graphics`

<img width="254" alt="Screen Shot 2021-05-06 at 6 19 42 PM" src="https://user-images.githubusercontent.com/24325294/117372504-a36c2380-ae97-11eb-842b-25b11a29aaf0.png">


To search for graphics you can enter any text you would like into the search bar at `localhost:3000/graphics`. This will then search for graphics who's title or description match your query and display them in order of relevance. You can also hit `localhost:3000/graphics?query={"my+query+here"}` directly.

<img width="1222" alt="Screen Shot 2021-05-06 at 6 20 12 PM" src="https://user-images.githubusercontent.com/24325294/117372558-b54dc680-ae97-11eb-8a01-3cdac19c101a.png">

To edit a graphic that you have already made you can visit `localhost:3000/graphics/1/edit`, or more generally `localhost:3000/graphics/{:id}`. This will allow you to change the title and description of an existing graphic.

<img width="1236" alt="Screen Shot 2021-05-06 at 6 20 37 PM" src="https://user-images.githubusercontent.com/24325294/117372584-c39be280-ae97-11eb-8a1d-926034f2da4e.png">


## Tests

I've been really interested in TDD from my experience with my last internship, and so I tried to use that methodology here. This application comes with a full test suite. There are unit tests for the `Graphic` model which test it's validation and saving logic, and there are integration tests for the `GraphicsController` that test the effect of http requests and ensure that each `GraphicsController` works as expected.

The full test suite can be run with: `bin/rails test`

<img width="435" alt="Screen Shot 2021-05-06 at 5 46 53 PM" src="https://user-images.githubusercontent.com/24325294/117369544-0d35fe80-ae93-11eb-9025-412772db7dee.png">

And all of the tests can be viewed at: `app/test` in the `models` and `controllers` directories respectivelly.

I did my best to have full test coverage. This included writing tests for creating `Graphics` with non-image files, submitting incomplete forms, and all http requests that can trigger a valid method in the `GraphicsController`. I could have further included testing for the views of the application to extend the coverage of the test suite more fully to the frontend. In a production application this would be essential, but I wanted to focus on the backend for this challenge.

## Design Choices

I developed this application with Rails. I made this choice to show my ability in working with Rails since I know that Shopify is heavily involved with the Rails community. But I think that this was also a good architectural decision for this application. Rails conventions are very powerful, and allowed me to develop a great deal of functionallity into this app very quickly. I was able to implement: adding, editing, searching, and displaying graphics in a small amount of code by working well with Rails 6 conventions.

Node.js, Django etc. would have been other architectural options. Those tools are feature rich and would have enabled me to develop a high quality application as well. But, especially since Shopify is test driven, having Minitest built into Rails (or an easy integration to use Rspec) allowed me to follow TDD methodologies and quickly produce a high-quality, well tested application in a time effective manner.

I also decided to use ERB to display my views, instead of just designing a backend API and calling it with a frontend framework like React. I made this decision because `html.erb` files are intended to display Rails views (convention=speed in this case) and because this was a developer challenge as opposed to frontend. I would like to point out though that at my last internship I worked with Vue.js + Rails so I am comfrotable connecting Rails to a modern frontend library (I believe Shopify uses React.) And that I am farmiliar with React: [here](https://shopify-frontend-intern-challenge.vercel.app/) is my Shopify frontend challenge to see my skills in React!

Finally, I used ActiveStorage to attach image files to a `Graphic` model. I could have managed image file procesing in a different way, manually working with blobs etc. but ActiveStorage was a robust solution that aligned well with Rails conventions. And I tried to stay true to Rails conventions throughout this application to optimize for quality, code brevity and speed.

## Extensions

To further this application there are several improvements that could be made:
- If this application were to go to production there should be more work done around authenticating the requests which can add `Graphics` to the database. I would probably add an authentication system (account management) and authenticate requests with `JWT`. 
- For this app to scale, the database selection should probably be changed. Currently, the application uses SQLite (again for Rails convention) but to scale well this should be substituted for PostgreSQL or a like solution that could better handle the demands of a large-scale application.
- To improve user experience I would connect the frontend to `bootstrapped` styling and use a modern frontend library like: `React` or `Vue.js` (and I would add tests for the frontend views)
- To improve user functionallity, I would add reverse image search using a pre-trained neural network, allowing users to search for images similar to the one that they uploaded. This would be a really cool feature that would enhance user experience!


Thanks for checking out my project :)


