# Add seed data in this file
puts "seeding spells..."
# these are the spells we want to add to the database
spells =["acid-arrow", "animal-messenger", "clam-emotions", "charm-person"]

#iterate over each spell
spells.each do |spell|
    response =RestClient.get "https://www.dnd5eapi.co/api/spells/#{spell}"
    spell_hash = JSON.parse(response)
    Spell.create(
        name:spell_hash["name"],
        level:spell_hash["level"],
        description:spell_hash["desc"][0]
    )

end

puts "Done seeding!"