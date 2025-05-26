# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

admin = User.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: 'admin'
)
puts "Admin créé: #{admin.email}"

# Créer des utilisateurs normaux
5.times do |i|
  user = User.create!(
    email: "user#{i + 1}@example.com",
    password: "password123",
    password_confirmation: "password123"
  )
  puts "Utilisateur créé: #{user.email}"
