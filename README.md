
<a name="readme-top"></a>

<div align="center">
  <br/>

  <h3><b>The Blog - Ruby on Rails</b></h3>

</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  <!-- - [Preview - Live Demo](#live-demo) -->
- [💻 Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  <!-- - [Install](#install) -->
  <!-- - [Usage](#usage) -->
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 The Blog <a name="about-project"></a>

**The Blog** 
The Blog app will be a classic example of a blog website. It is a fully functional website that will show the list of posts and empower readers to interact with them by adding comments and liking posts.
## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<a href="https://www.ruby-lang.org/en/">Ruby</a>
<a href="https://rubyonrails.org">Rails</a>

<!-- Features -->

### Key Features <a name="key-features"></a>
- Use of Rails as a framework for full stack development

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

To run this project you need:

- Ruby installed and running on your computer
- Rails and all the necessary dependencies installed
- PostgreSQL installed and running


### Setup
- run `ruby bin\rails db:create` to create the starting database
- run `ruby bin\rails db:migrate` to update the database accordingly to the schema
- Create users and posts manually (so it doesn't appear empty)
  - Run rails console `rails c`
  - Create users, posts, and if necessary, comments
    - `user1 = User.create(name: 'Tom', photo: 'https://picsum.photos/100', bio: 'Teacher from Mexico.', posts_counter: 0)` 
    - `post1 = Post.create(author: **your_new_user**, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)`
    - OPTIONAL: `comment1 = Comment.create(post: **your_new_post**, user: **your_new_user**, text: 'Hi Tom!')`
  - See the app in your local host
    - Run the server with `rails server` or `rails s`
    - Open your local server url in a browser
      - Ex. `http://127.0.0.1:3000`

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Esteban Palacios**

- GitHub: [@Estete9](https://github.com/Estete9)
- Twitter: [@NaughTban](https://twitter.com/NaughTban)
- LinkedIn: [Esteban Palacios](https://www.linkedin.com/in/dev-esteban-palacios/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>


- **GUI to show the data to users**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

##### Don't be afraid to contact me to contribute to the project.


<br>
Contributions, issues, and feature requests are welcome!




<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>
Feel free to check the [issues page UPDATE URL HERE](https://github.com/Estete9/blog-app-ror/issues).


If you like this project remember to star and share it 🥳️

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>


- ACKNOWLEDGMENTS TO CREATIVE LICENSE AND OTHERS

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./MIT.md)-licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
