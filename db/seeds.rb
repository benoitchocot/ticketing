# 1. Créer des priorités
priorities = [
  { title: 'Critique', color: '#FF0000' },
  { title: 'Haute', color: '#FFA500' },
  { title: 'Moyenne', color: '#FFFF00' },
  { title: 'Basse', color: '#008000' },
  { title: 'Très basse', color: '#0000FF' }
]

priorities.each do |priority|
  Priority.create!(priority)
end
puts "Priorités créées."

# 2. Créer des statuts
statuses = [
  { title: 'En cours' },
  { title: 'En attente de correction' },
  { title: 'Fermé' },
  { title: 'En progrès' }
]

statuses.each do |status|
  Status.create!(status)
end
puts "Statuts créés."

# 3. Créer des utilisateurs
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

  # 4. Créer des tickets pour chaque utilisateur
  5.times do
    ticket = Ticket.create!(
      title: "Ticket ##{rand(1000..9999)}",
      priority_id: Priority.all.sample.id,  # Priorité aléatoire
      status_id: Status.all.sample.id      # Statut aléatoire
    )
    puts "Ticket créé: #{ticket.title}"

    # Créer la description en tant que texte enrichi (ActionText)
    ticket.description = ActionText::RichText.create!(
      name: 'description',
      body: "Description enrichie pour le ticket ##{ticket.id}",
      record_type: 'Ticket',
      record_id: ticket.id
    )
    ticket.save!  # Sauvegarde le ticket après avoir ajouté la description
    puts "Description enrichie créée pour le ticket ##{ticket.id}"

    # Associer cet utilisateur au ticket (relation many-to-many)
    ticket.users << user
    puts "Utilisateur #{user.email} ajouté au ticket #{ticket.title}"
  end
end

puts "Tickets créés."
puts "🌱 Seed terminé avec succès ! 🎉"
