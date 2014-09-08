# Arnold Clark Webapp

What is the Arnold Clark Image loadertron 2000 web app?
-------------------------------------------------------

This is the main web application in our app stack. This is what the end user interacts with. You enter in a registration and stock reference number and submit the image search request. This goes off to the sister application which is our image finder API application. That will determine which images are present and return JSON describing which images are present and some associated meta-data. At this point this web app will render the images that were found in the image gallery.

Install and run
---------------

1. Install Ruby 2.1.0 and bundle gem
2. Install webapp and run
```shell
git clone https://github.com/paulcockrell/arnoldclark-webapp.git
cd ./arnoldclark-webapp
bundle install
bundle exec rails s -p 3000 # this port number is vital
```

3. Install api app and run
```shell
git clone https://github.com/paulcockrell/arnoldclark-api.git
cd ./arnoldclark-api
bundle install
bundle exec rails-api s -p 3001 # this port number is vital
```

4. Visit http://localhost:3000 in your browser
5. Enter registration and stock reference and click load button, you will get a response after a short while.

Test
----

You must have the API app running as we do browser tests that call out to it.

Also there is a currently known registration and stock reference hardcoded into the test, if that is no longer valid then the tests (or one) will fail.

```shell
cd ./arnoldclark-webapp
bundle exec rspec -f documentation
```
