[![hire-badge](https://img.shields.io/badge/Consult%20/%20Hire%20Ikraam-Click%20to%20Contact-brightgreen)](mailto:consult.ikraam@gmail.com) [![Twitter Follow](https://img.shields.io/twitter/follow/GhoorIkraam?label=Follow%20Ikraam%20on%20Twitter&style=social)](https://twitter.com/GhoorIkraam)

# Great Shorts - The community-driven short-story sharing site

- This site is a community-driven short-story sharing site that allows users to write and upvote their favourite stories.

- The application has Google and Github (OmniAuth) sign in options in addition to a standard login.

- Built in Ruby on Rails: A user can create, edit, delete and upvote articles.

- The short-stories are categorized into various genres and links to each category can be found on the homepage bottom blocks which feature the most recent story written for the genre.

- The story with the most number of votes is displayed in the large featured section of the homepage.

- Categories can be created/updated/deleted via the admin account (admin@admin.com). The top 4 prioritised catagories are displayed in the top-links and homepage.

- RSpec and Capybara were used to run the unit and integration tests.

- The 'bullet-gem' was used to identify cases of N+1 queries. N+1 queries were removed when found and unnecessary eager loading was also minimized.

- Active Storage with Amazon s3 was used instead of local image storage as images don't persist on heroku free deployments.

## Live Demo and Presentation

- The project was deployed on Heroku: [Live Demo Link](https://great-books-site.herokuapp.com/)
- [Presentation Video](https://www.loom.com/share/c418e037437c4351977fa2f656165008)

## Screenshots

<p align="center">
  <img src="https://user-images.githubusercontent.com/34813339/84836200-8f2bf780-b035-11ea-9421-a5c2a4666f9f.png"/>
</p>

<p align="center">
  <img src="https://user-images.githubusercontent.com/34813339/84836184-876c5300-b035-11ea-9131-0bf30d7700b5.png"/>
  <img src="https://user-images.githubusercontent.com/34813339/84884936-a220e500-b092-11ea-89eb-ae2f0a928705.png"/>
</p>

## Built With

- Ruby 2.6.5 and Rails 5.2.4.2
- Bootstrap 4
- Deployed on Heroku

## Getting Started

To get a local copy up and running follow these steps:

### Prerequisites

- Ruby: 2.6.3
- Rails: 6.0.3
- Postgres: >=9.5
- Git

### Usage

- Fork/Clone this project to your local machine and checkout to required branch:

```Bash
    git clone git@github.com:ikraamg/Great-Books.git
    cd Great-Books
    git checkout core-feature
```

#### Install gems with

```Ruby
    bundle install
```

Please note that the OmniAuth via Google and GitHub as well as Active Storage with Amazon S3 will not work on another deployment unless the API credentials are set up in Rails.

If you are **NOT** using Google or GitHub sign in methods and **NOT** using AWS S3 Buckets for active storage, you will need to make the following changes:

1. Delete the `config/credentials.yml.enc` file.

2. Run the following command in the repository terminal, you can change 'code' which is the VScode editor to 'atom' if needed.

```Bash
EDITOR="code --wait" rails credentials:edit
#you can change the 'code' editor to 'atom' or other editors as needed.
```

This should create a new credentials and master key file as well as open an editor which you will need to add the follwing code:

```Ruby
aws:
  access_key_id: '123'
  secret_access_key: '123'
  region: '123'
  dev:
    bucket: '123'
  prod:
    bucket: '123'

github:
  client_id: '123'
  client_secret: '123'
google_oauth2:
  client_id: '123'
  client_secret: '123'
```

Close the file to save, the terminal should print: 'File encrypted and saved'.

3. Change **line 31** in config/environments/development.rb and **line 38** in config/environments/production.rb to:

```Ruby
#config/environments/development.rb
#config/environments/production.rb
config.active_storage.service = :local
```

#### OmniAuth Setup - Optional

If you are **optionally** using the Google and GitHub sign-in then:
Please follow [this guide](https://johnofsydney.github.io/notes/rails/rails_social_login.html#register-your-app-with-github-and-google) to get the credentials.

[This section](https://johnofsydney.github.io/notes/rails/rails_social_login.html#encrypted-credentials-1) will explain how to enter the credentials into the app.

#### Active Storage Setup - Optional

If you are **optionally** using AWS S3 buckets for active storage, please follow this [tutorial](https://medium.com/@iachieve80/rails-6-0-upload-images-using-active-storage-and-amazon-simple-storage-service-amazon-s3-36861c03dc4a)(skipping the 'Setting up Active Storage' section).

#### Setup database with

```Ruby
    yarn install --check-files
    rails db:create
    rails db:migrate
```

#### Start server with

```Ruby
    rails server
```

### Running tests

```Ruby
    bundle exec rspec --format documentation
```

- Open a web page and go to [port 3000 on your local machine.](http://localhost:3000)

### Deployment

The application was deployed on Heroku.
To deploy your own copy, you can follow the following [steps:](https://devcenter.heroku.com/articles/git)
To allow Heroku to access the encrpyted api keys, use this command in your Heroku connected CLI:

```Ruby
heroku config:set RAILS_MASTER_KEY= <master.key>
```

(The master key can be found in the `/config/master.key` file)

## Authors

👤 **Ikraam Ghoor**

- Github: [@ikraamg](https://github.com/ikraamg)
- Twitter: [@GhoorIkraam](https://twitter.com/GhoorIkraam)
- LinkedIn: [isghoor](https://linkedin.com/isghoor)
- Email: [consult.ikraam@gmail.com](mailto:consult.ikraam@gmail.com)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/ikraamg/Great-Books/issues)

Start by:

- Forking the project
- Cloning the project to your local machine
- `cd` into the project directory
- Run `git checkout -b your-branch-name.`
- Make your contributions
- Push your branch up to your forked repository
- Open a Pull Request with a detailed description of the development(or master if not available) branch of the original project for a review

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Nelson Sakwa](https://www.behance.net/sakwadesignstudio) for the design.

## 📝 License

This project is [MIT](LICENSE) licensed with the exception of the design, which is under the [Creative Commons License](https://creativecommons.org/licenses/by-nc-nd/4.0/) and attributed to [Nelson Sakwa](https://www.behance.net/sakwadesignstudio).
