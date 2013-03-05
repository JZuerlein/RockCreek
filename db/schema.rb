# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130304180244) do

  create_table "change_requests", :force => true do |t|
    t.integer  "requester_id"
    t.date     "request_date"
    t.string   "status"
    t.string   "summary"
    t.string   "description"
    t.string   "change_type"
    t.integer  "assigned_to"
    t.date     "due_date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "tenant_id"
  end

  add_index "change_requests", ["tenant_id"], :name => "index_change_requests_on_tenant_id"

  create_table "change_types", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "invite_users", :force => true do |t|
    t.string   "subdomain"
    t.string   "email"
    t.string   "email_invitation_token"
    t.date     "email_invitation_sent_at"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password"
    t.string   "password_confirmation"
    t.integer  "tenant_id"
  end

  add_index "invite_users", ["tenant_id"], :name => "index_invite_users_on_tenant_id"

  create_table "request_responses", :force => true do |t|
    t.string   "response"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "tenant_id"
    t.integer  "user_id"
    t.integer  "change_request_id"
  end

  add_index "request_responses", ["change_request_id"], :name => "index_request_responses_on_change_request_id"
  add_index "request_responses", ["tenant_id"], :name => "index_request_responses_on_tenant_id"
  add_index "request_responses", ["user_id"], :name => "index_request_responses_on_user_id"

  create_table "signups", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "company"
    t.string   "password_digest"
    t.string   "site_address"
    t.string   "credit_card"
    t.integer  "expires_on_month"
    t.integer  "expires_on_year"
    t.integer  "billing_zip"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "email_confirmation_token"
    t.datetime "email_confirmation_sent_at"
  end

  create_table "statuses", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  create_table "tenants", :force => true do |t|
    t.string   "name"
    t.string   "subdomain"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_group_assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "tenant_id"
  end

  add_index "user_group_assignments", ["tenant_id"], :name => "index_user_group_assignments_on_tenant_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.boolean  "confirmed"
    t.integer  "tenant_id"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["tenant_id"], :name => "index_users_on_tenant_id"

end
