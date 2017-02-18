# all-contributors-atom
Atom package for easy implementation of all-contributors spec within atom editor

![allcontributors.gif](allcontributors.gif)

### Usage
Open a project using (Why? [#1](https://github.com/o-d-i-n/all-contributors-atom/issues/1))

```bash
atom ProjectName
```

in your terminal and paste the following towards the end:

```html
<!-- Contributors START
fname_mname_lname githubUsername websiteLink contributionType1 contributionType2
fname_mname_lname githubUsername websiteLink contributionType1 contributionType5 contributionType7
fname_mname_lname githubUsername websiteLink contributionType3
Contributors END -->
<!-- Contributors table START -->
<!-- Contributors table END -->
This project follows the [all-contributors](https://github.com/kentcdodds/all-contributors) specification.
```
Hit `ctrl+alt+p` to parse the contributors list to build contributors' table as specified in the [all-contributors spec](https://github.com/kentcdodds/all-contributors).

You can reduce the boilerplate to only adding contributers details by using **addcon-i** snippet on an markdown file. The snippet produces:

```html
<!-- Contributors START
Contributors END -->
<!-- Contributors table START -->
<!-- Contributors table END -->
This project follows the [all-contributors](https://github.com/kentcdodds/all-contributors) specification.
```
#### Adding a contributor
Inside the _Contributors START_ comment, start from a newline, the name of the person concatenated by underscore for breaks(eg. Mayank_Badola), his/her github username, his/her website url and all the types of contributions made by that user.  
Make sure you seperate these details by a space character.(eg. Mayank_Badola mbad0la http://mbad0la.github.io code doc)  
Press `ctrl+alt+p` to refresh the tables.

#### Contribution Types
Type | Represents |
:---: | :---:
code | Code
utility | Plugin/utility libraries
tools | Tools
infra | Infrastructure (Hosting, Build-Tools, etc)
doc | Documentation
translation | Translation
answers | Answering Questions (in Issues, Stack Overflow, Gitter, Slack, etc.)
tests | Tests
bug | Bug reports
example | Examples
blogpost | Blogposts
tutorial | Tutorials
video | Videos
talks | Talks
design | Design
prReview | Reviewed Pull Requests

#### Contributors
| [<img src="https://avatars.githubusercontent.com/mbad0la?s=100" width="100" alt="Mayank Badola" /><br /><sub>Mayank Badola</sub>](http://mbad0la.github.io)<br />[💻](https://github.com/o-d-i-n/all-contributors-atom/commits?author=mbad0la) [📖](https://github.com/o-d-i-n/all-contributors-atom/commits?author=mbad0la) | [<img src="https://avatars.githubusercontent.com/bogas04?s=100" width="100" alt="Divjot Singh" /><br /><sub>Divjot Singh</sub>](http://bogas04.github.io)<br />[💻](https://github.com/o-d-i-n/all-contributors-atom/commits?author=bogas04) [📖](https://github.com/o-d-i-n/all-contributors-atom/commits?author=bogas04) | [<img src="https://avatars.githubusercontent.com/taml?s=100" width="100" alt="Tam Love" /><br /><sub>Tam Love</sub>](https://github.com/taml)<br /> [💻](https://github.com/o-d-i-n/all-contributors-atom/commits?author=taml) [📖](https://github.com/o-d-i-n/all-contributors-atom/commits?author=taml) | [<img src="https://avatars.githubusercontent.com/diegohaz?s=100" width="100" alt="Haz" /><br /><sub>Haz</sub>](https://github.com/diegohaz)<br /> [💻](https://github.com/o-d-i-n/all-contributors-atom/commits?author=diegohaz) |
| :---: | :---: | :---: | :---: |

Any further contributions are more than welcome to help make this utility more awesome!
