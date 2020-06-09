require 'active_record'
require 'logger'
require 'pry'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:'
)
ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Schema.define do
  # TODO: Update the schema to include the specific tables or columns necessary
  # to reproduct the bug
  create_table :posts, force: true do |t|
    t.string :body
    t.integer :author_id
  end

  create_table :refs, force: true do |t|
    t.string :name, null: false
    t.string :target_type
    t.integer :target_id
  end

  create_table :authors, force: true do |t|
    t.string :name
  end
end

