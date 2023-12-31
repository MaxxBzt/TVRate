// Update with your config settings.

/**
 * @type { Object.<string, import("knex").Knex.Config> }
 */
module.exports = {


  development: {
    client: 'postgresql',
    connection: {
      database: 'TVRateDb',
      user:     'max',
      password: null
    },
    pool: {
      min: 2,
      max: 10
    },
    migrations: {
      tableName: '/migrations'
    }
  },



};
