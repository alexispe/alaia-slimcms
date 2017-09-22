# ALAIA

[![N|Solid](https://i.imgur.com/i7CZ4qC.png)](http://alexis-petit.fr)

`WARNING: This project is actually in developpement and all fonctionnality are not working. You can place a star to support me.`

Alaia is a simple modular CMS created with [Slim framework](https://www.slimframework.com/)
This one is perfect for creation of blogs, presentation sites and all simples websites.

# Features!

  - Admin login with secure url
  - Pages (create/update/delete)
  - Articles (create/update/delete)
  - Categories of articles (create/update/delete)
  - Users (create/update/delete)
  - Roles of users (create/update/delete)

All theses features can be used easily with the administration interface.

| Login | List pages | Update page |
| ------ | ------ | ------ |
| ![Login image](https://i.imgur.com/jGBSedc.png) | ![List page image](https://i.imgur.com/cCAo10Y.png) | ![List page image](https://imgur.com/HRbRbXl.png) |
More screenshots coming soon.

##### Modules
- Page builder : this module allow you to create and update pages easily. It works thanks to a block system. You can drang and drop blocks to update page.

Others modules will be added in the future.

# Installation

```sh
$ git clone https://github.com/alexispe/alaia-slimcms.git
$ cd alaia-slimcms
$ php composer install
```
After install set write permissions on `/tmp/cache`

Create database and user whiwh have access. Please don't use root.
Import tables and data from `/app/install/init.sql`.
Update `/app/install/init.json` with our database access. Set init to true and save.

Change the name of the default page in `/app/Controllers/HomeController.php` line 9. (this will be automated soon)

Default access is user : `admin` and password : `admin`. Don't forget to change that.

Installation done.

# Todos

  - [x] Setup tool for first installation
  - [x] Articles administration
  - [x] Menu administration
  - [ ] Settings page
  - [ ] Interface for default page

# You need help ?
If you have problems on installation please contact me at *contact@alexis-petit.fr* and I will try to help you.

Made with :heart: by @alexispe [alexis-petit.fr](http://www.alexis-petit.fr)
