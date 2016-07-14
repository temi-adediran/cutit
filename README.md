# Cutit 
[![Build Status](https://travis-ci.org/andela-tfowotade/cutit.svg?branch=develop)](https://travis-ci.org/andela-tfowotade/cutit)
[![Coverage Status](https://coveralls.io/repos/github/andela-tfowotade/cutit/badge.svg?branch=develop)](https://coveralls.io/github/andela-tfowotade/cutit?branch=develop)

### Overview

This is a URL shortening service built with Ruby on rails. The application allows you shorten your long URLs and also provide a slug to provide more information about your shortened URLs. It is a clone of the popular 

### Features

User is able to do the following in the application:
* Create shortened URLs
* View recently added URLs, influential users and popular URLs.
* Use an optional vanity string that will be appended to the shortened link.
* Track the number of visits and statistics of individuals that visit the shortened Url.
* Edit the shortened Url.
* Delete a shortened Url.


### Getting Started

Visit http://cut.herokuapp.com and shorten your long URLs away. However, to track the usage of your shortened URLs, `sign up` and shorten your URLs in your dashboard. 

* To view the statistics of your shortened URLs, click the `details` button. This displays the number of visits, link status and information of individuals that visit the shortened Url

* To edit the shortened Url, click the `edit` button.

* To delete the shortened link, click the `delete` button.

### External Dependencies

* Bootstrap
* Font Awesome
* jquery

For a full list of dependcies please check our <a href="https://github.com/andela-tfowotade/cutit/blob/develop/Gemfile">Gemfile</a>.

### Tests

Cutit uses the `rspec` and the Capybara gem for integration test. Continuous Integration is carried out via Travis CI. 

To test locally, go through the following steps.

1. Clone the repo to your local machine.

  ```bash
  $  git clone https://github.com/andela-tfowotade/cutit.git
  ```

2. `cd` into the `cutit` folder.

  ```bash
  $  cd cutit
  ```
3. Install dependencies

  ```bash
    $  bundle install
  ```

4. Set up the database.

```bash
$ rake db:setup
```

5. Migrate the database.

```bash
$  rake db:migrate
```

6. Run the tests.

```bash
$  bundle exec rspec
```

### Limitations

* No API support
* No Ruby gem
* No validation to check the existence of the Url
* No measures to return the same shortened URLs for long URLs that have already been shortened.
