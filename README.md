[![hire-badge](https://img.shields.io/badge/Consult%20/%20Hire%20Ikraam-Click%20to%20Contact-brightgreen)](mailto:consult.ikraam@gmail.com) [![Twitter Follow](https://img.shields.io/twitter/follow/GhoorIkraam?label=Follow%20Ikraam%20on%20Twitter&style=social)](https://twitter.com/GhoorIkraam)

# Great Shorts - The community-driven short-story sharing site

> This site is a community-driven short-story sharing site that allows users to write and upvote their favourite stories.
> The application has Google and Github (OmniAuth) sign in options in addition to a standard login.
> Built in Ruby on Rails: A user can create, edit, delete and upvote articles.
> The short-stories are categorized into various genres and links to each category can be found on the homepage bottom blocks which feature the most recent story written for the genre.
> The story with the most number of votes is displayed in the large featured section of the homepage.
> RSpec and Capybara were used to run the unit and integration tests.

## Live Demo

- The project was deployed on Heroku: [Live Demo Link](https://great-books-site.herokuapp.com/)

## Screenshots

<p align="center">
  <img src="https://user-images.githubusercontent.com/34813339/84836200-8f2bf780-b035-11ea-9421-a5c2a4666f9f.png"/>
</p>

<p align="center">
  <img src="https://user-images.githubusercontent.com/34813339/84836184-876c5300-b035-11ea-9131-0bf30d7700b5.png"/>
</p>

## Built With

- Ruby 2.6.5 and Rails 5.2.4.2
- Bootstrap 4
- Deployed on Heroku

## Getting Started

To get a local copy up and running follow these steps:

### Prerequisites

- Ruby: 2.6.3
- Rails: 5.2.3
- Postgres: >=9.5
- Git

### Usage

- Fork/Clone this project to your local machine
- Open the folder in your local environment and run these lines of code to get started:

Install gems with:

```Ruby
    bundle install
```

Setup database with:

```Ruby
   rails DB:create
   rails DB:migrate
```

Start server with:

```Ruby
    rails server
```

### Running tests

```Ruby
    bundle exec RSpec --format documentation
```

- Open a web page and go to [port 3000 on your local machine.](http://localhost:3000)

### Deployment

The application was deployed on Heroku.
To deploy your own copy, you can follow the following [steps:](https://devcenter.heroku.com/articles/git)

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
