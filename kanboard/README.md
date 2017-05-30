# Kanboard on platform.sh

This project provides an example configuration for hosting Kanboard with a MySQL database on Platform.sh.

[Kanboard](https://kanboard.net/) by Frédéric Guillot

* GitHub Repository: [https://github.com/kanboard/kanboard](https://github.com/kanboard/kanboard)
* Documentation: [https://kanboard.net/documentation/](https://kanboard.net/documentation/)

### Installed Plugins

1. Gantt-Plugin: [https://github.com/kanboard/plugin-gantt](https://github.com/kanboard/plugin-gantt)
2. Calender-Plugin: [https://github.com/kanboard/plugin-calendar](https://github.com/kanboard/plugin-calendar)


## Starting a new project

To start a new kanboard based on this configuration, follow these 4 simple steps:

1. Clone this repository locally.  You may optionally remove the `origin` remote or remove the `.git` directory and re-init the project if you want a clean history.
 
2. Create a new project through the Platform.sh user interface and select "Import an existing project" when prompted.

3. Run the provided Git commands to add a Platform.sh remote and push the code to the Platform.sh repository.

4. Use the [default credentials](https://kanboard.net/documentation/installation) to enter your newly created Kanboard.

That's it! You now have a working Kanboard application.

## Using as a reference

You can also use this repository as a reference for your own projects, and borrow whatever code is needed. The most important parts are the `.platform.app.yaml` file, the `.platform` directory and the `composer.json`.


## Upgrade to a new Kanboard release

1. Check [ChangeLog](https://github.com/kanboard/kanboard/blob/master/ChangeLog) for any breaking changes in the new stable relase and how to resolve them. Check also for updates on plugins.
2. Change the version number of Kanboard in the `composer.json` to the new stable release. We tell composer to use a specific tag while fetching the dependency.
<pre>
# for example
"require": {
    "fguillot/kanboard": "x.x.x"
}
</pre>
5. Change version of any updated plugins in `composer.json`. It might be necessary to change the required Kanboard version for the plugin. Check the plugin repository on github for the required dependencies.
<pre>
# for example
{
  "type": "package",
  "package": {
	"name": "fguillot/plugin-gantt",
	"version": "x.x.x",
	"type": "kanboard-plugin",
	"dist": {
	  "url": "https://github.com/kanboard/plugin-gantt/zipball/vx.x.x/",
	  "type": "zip"
	},
	"require": {
	  "fguillot/kanboard": ">=1.0.43"
	}
  }
},
...
"require": {
	...
    "fguillot/plugin-gantt": "x.x.x"
}
</pre>
6. Update dependencies via composer:
<pre>
composer update
</pre>
7. Commit changes to `composer.json` and `composer.lock`.
8. Publish local commits to trigger a new platform build.
