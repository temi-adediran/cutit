ActiveRecord::Schema.define(version: 20_160_714_022_152) do
  create_table 'urls', force: :cascade do |t|
    t.string   'long_url'
    t.string   'short_url'
    t.datetime 'created_at',                  null: false
    t.datetime 'updated_at',                  null: false
    t.integer  'user_id'
    t.boolean  'status',       default: true
    t.integer  'visits_count', default: 0
  end

  add_index 'urls', ['short_url'], name: 'index_urls_on_short_url', unique: true
  add_index 'urls', ['user_id'], name: 'index_urls_on_user_id'

  create_table 'users', force: :cascade do |t|
    t.string   'username'
    t.string   'email'
    t.datetime 'created_at',                  null: false
    t.datetime 'updated_at',                  null: false
    t.string   'password_digest'
    t.integer  'urls_count', default: 0
  end

  add_index 'users', ['email'], name: 'index_users_on_email', unique: true

  create_table 'visits', force: :cascade do |t|
    t.string   'browser'
    t.string   'version'
    t.string   'platform'
    t.string   'os'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer  'url_id'
  end

  add_index 'visits', ['url_id'], name: 'index_visits_on_url_id'
end
