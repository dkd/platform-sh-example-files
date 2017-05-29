<?php

// Run automatically database migrations
// If set to false, you will have to run manually the SQL migrations from the CLI during the next Kanboard upgrade
// Do not run the migrations from multiple processes at the same time (example: web page + background worker)
define('DB_RUN_MIGRATIONS', false);

$relationships = getenv("PLATFORM_RELATIONSHIPS");

if ($relationships) {
    $relationships = json_decode(base64_decode($relationships), true);
    foreach ($relationships['database'] as $endpoint) {
        if (empty($endpoint['query']['is_master'])) {
            continue;
        }

        if ($endpoint['scheme'] === 'mysql') {
            define('DB_DRIVER', 'mysql');
        }

        // Mysql/Postgres username
        define('DB_USERNAME', $endpoint['username']);

        // Mysql/Postgres password
        define('DB_PASSWORD', $endpoint['password']);

        // Mysql/Postgres hostname
        define('DB_HOSTNAME', $endpoint['host']);

        // Mysql/Postgres database name
        define('DB_NAME', $endpoint['path']);

        // Mysql/Postgres custom port (null = default port)
        define('DB_PORT', $endpoint['port']);
    }
}

