
<a name="readme-top"></a>
<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/Weather-Together/weather_together_fe">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">Weather Together</h3>

  <p align="center">
    project_description
    <br />
    <a href="https://github.com/Weather-Together/weather_together_fe"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/Weather-Together/weather_together_fe">View Demo</a>
    ·
    <a href="https://github.com/Weather-Together/weather_together_fe/issues">Report Bug</a>
    ·
    <a href="https://github.com/Weather-Together/weather_together_fe/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
        <li><a href="#gems">Gems</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#contributers">Contributers</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](FINAL URL LATER)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

* [![Bootstrap][Bootstrap.com]][Bootstrap-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Gems

* [![saasc-rails][gem-saasc-rails]][gem-saasc-rails-url]
* [![faraday-rails][gem-faraday-rails]][gem-faraday-rails-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

UPDATE WITH ANY OR REMOVE

### Installation

1. Get a free TomTom API Key at [https://developer.tomtom.com/](https://developer.tomtom.com/)
2. Clone the repo
   ```sh
   git clone https://github.com/Weather-Together/weather_together_fe.git
   ```
3. Enter your API in `UPDATE ON WHERE LATER`
   ```js
   const API_KEY = 'ENTER YOUR API';
   ```
4. Gem Bundle
   ```sh
    bundle
   ```
5. Rake
   ```sh
    rails db:{drop,create,migrate,seed}
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

Weather Together is a game app where a daily set of weather data is displayed to the user (player) from a randomly selected location in the world. Each day the player guesses a location where they think this weather data was collected through an interactive map selector. They are able to keep track of prior guesses as well as track their progress on a leaderboard.

The goal of this app is to provide public education and increase awareness of general global climate trends in a fun and interactive manner.

This portion of the app handles the frontend functionality of the game:
* Handles user account creation, verification, and login.
* Provides the user interface for the app.
* Collects user input through location guesses on an externally consumed interactive map and passes this information to the backend portion of the application.
* Displays results to the user calculcated from the backend.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

- [ ] New User Creation
    - [ ] Information Input
    - [ ] Account verification and activation, through email link
- [ ] User Login (Basic)
- [ ] User Login (Expanded)
    - [ ] Two Factor Authentication
    - [ ] Passwordless Login
- [ ] Interactive Map Selector
    - [ ] Map Display
    - [ ] Pin Drop at a Lat/Lon
- [ ] User Dashboard
- [ ] Results 
- [ ] Mobile Functionality
- [ ] Decorator
- [ ] Addition of Private Games



See the [open issues](https://github.com/Weather-Together/weather_together_fe/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Organization: Weather Together - UPDATE WITH FUTURE EMAIL

Organization Link: [https://github.com/Weather-Together](https://github.com/Weather-Together)

Project Link: [https://github.com/Weather-Together/weather_together_fe](https://github.com/Weather-Together/weather_together_fe)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



## Contributors

[![LinkedIn][linkedin-shield]][linkedin-url-mk] Michael Kuhlmeier
[![LinkedIn][linkedin-shield]][linkedin-url-bk] Blaine Kennedy
[![LinkedIn][linkedin-shield]][linkedin-url-jo] John O'leary
[![LinkedIn][linkedin-shield]][linkedin-url-st] Sam Tran
[![LinkedIn][linkedin-shield]][linkedin-url-kz] Kevin Zolman



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Weather-Together/weather_together_fe.svg?style=for-the-badge
[contributors-url]: https://github.com/Weather-Together/weather_together_fe/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Weather-Together/weather_together_fe.svg?style=for-the-badge
[forks-url]: https://github.com/Weather-Together/weather_together_fe/network/members
[stars-shield]: https://img.shields.io/github/stars/Weather-Together/weather_together_fe.svg?style=for-the-badge
[stars-url]: https://github.com/Weather-Together/weather_together_fe/stargazers
[issues-shield]: https://img.shields.io/github/issues/Weather-Together/weather_together_fe.svg?style=for-the-badge
[issues-url]: https://github.com/Weather-Together/weather_together_fe/issues
[license-shield]: https://img.shields.io/github/license/Weather-Together/weather_together_fe.svg?style=for-the-badge
[license-url]: https://github.com/Weather-Together/weather_together_fe/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url-st]: https://www.linkedin.com/in/sam-t-tran
[linkedin-url-kz]: https://www.linkedin.com/in/kevin-zolman
[linkedin-url-mk]: https://www.linkedin.com/in/michaelkuhlmeier
[linkedin-url-bk]: https://www.linkedin.com/in/blaine-kennedy
[linkedin-url-jo]: https://www.linkedin.com/in/john-clay-oleary
[product-screenshot]: images/screenshot.png
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[gem-saasc-rails]: https://img.shields.io/badge/sassc--rails?style=flat-square&label=saasc-rails
[gem-saasc-rails-url]: https://github.com/sass/sassc-rails
[gem-faraday-rails]: https://img.shields.io/badge/faraday--rails?style=flat-square
[gem-faraday-rails-url]: https://lostisland.github.io/faraday/#/