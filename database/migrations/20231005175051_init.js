/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */



exports.up = function(knex) {
    return knex.schema.createTable('shows', (table) => {
        table.increments('id').primary();
        table.string('name').notNullable();
        table.string('description').notNullable();
        table.integer('rating').notNullable();
        table.string('img_url').notNullable();    
    });
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function(knex) {
  return knex.schema.dropTable('shows');
};
