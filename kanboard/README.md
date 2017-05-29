# Kanboard on platform.sh

[Kanboard](https://kanboard.net/) by Frédéric Guillot

* GitHub Repository: https://github.com/kanboard/kanboard
* Documentation: https://kanboard.net/documentation/

### Installed Plugins

1. Gantt-Plugin: https://github.com/kanboard/plugin-gantt
2. Calender-Plugin: https://github.com/kanboard/plugin-calendar


## Kanboard upgrade to a new released version

1. Check [ChangeLog](https://github.com/kanboard/kanboard/blob/master/ChangeLog) for any breaking changes in the new stable relase and how to resolve them. Check also for updates on plugins.
2. Create a snaphot of the development branch `develop`.
<pre>
# Switch to the develop environment
platform checkout develop
 
# Create snaphot of the current environment
platform snapshot:create
</pre>
3. Change the version number of Kanboard in the `composer.json` to the new stable release. We tell composer to use a specific tag while fetching the dependency.
<pre>
# for example
"require": {
    "fguillot/kanboard": "x.x.x"
}
</pre>
5. Change version of updated plugins in `composer.json`. It might be necessary to change the required kanboard version for the plugin. Check the plugin repository on github for the required dependencies.
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
7. Check for any composer errors. If any arise try to resolve them.
8. Commit changes in `composer.json` and `composer.lock` files. Also list updated plugins in the commit message.
<pre>
git commit -m "Issue #xxxxx: update kanboard to version x.x.x"
</pre>
9. Publish local commits to trigger a new platform build.
<pre>
git push
</pre>
10. After the platform is rebuilt:
* Verify functionality of the application on the develop environment.
* Check the version in the application settings (https://{url}/settings)


## Merge new version into the Master

1. Create a snapshot of the master branch `Master`.
<pre>
# Switch to the master environment
platform checkout master
 
# Create snaphot of the current environment
platform snapshot:create
</pre>
2. Merge `develop` into `master`
<pre>
# This will merge the develop environment into its parent master
platform merge develop
</pre>
3. After the platform is rebuilt:
* Verify functionality of the application on the master environment.
* Check the version in the application settings (https://{url}/settings) 
