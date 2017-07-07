task delete_image_bug: :environment do
  u = User.first || User.create(name: 'me')
  u[:image] = nil
  u.save

  i = DefaultImage.first || DefaultImage.create
  i[:image] = nil
  i.save
  f = File.open('public/default_image.png')
  i.update(image: f)
  f.close

  puts "=============="
  puts "PREPARE"
  puts "=============="
  puts "--------------"
  puts "User image attribute is"
  puts "u[:image]: #{u[:image] || 'nil'}"
  puts "--------------"
  puts "User image is"
  puts "u.image: #{u.image}"
  puts "--------------"
  puts "DefaultImage image is"
  puts "i.image: #{i.image}"
  puts "--------------"
  puts "DefaultImage image file exists?"
  puts "default_image.image.file.exists? #{before = i.image.file.exists?}"
  puts

  u.update(image: File.open('public/user_image.png'))
  puts "=============="
  puts "UPDATE USER IMAGE"
  puts "=============="
  puts "--------------"
  puts "Update user's image"
  puts "u.update(image: File.open('public/user_image.png'))"
  puts "--------------"
  puts "User image attribute is"
  puts "u[:image]: #{u[:image] || 'nil'}"
  puts "--------------"
  puts "User image is"
  puts "u.image: #{u.image}"
  puts "--------------"
  puts "DefaultImage image is"
  puts "i.image: #{i.image}"
  puts "--------------"
  puts "DefaultImage image file exists?"
  puts "default_image.image.file.exists? #{after = i.image.file.exists?}"
  puts

  f = File.open('public/default_image.png')
  i.update(image: f)
  f.close
  puts "=============="
  puts "UPDATE DEFAULT IMAGE AGAIN"
  puts "=============="
  puts "--------------"
  puts "DefaultImage image file exists?"
  puts "default_image.image.file.exists? #{recover = i.image.file.exists?}"
  puts

  puts "DefaultImage Exists ?"
  puts "Before: #{before}, After: #{after}, Recovered: #{recover}"
end
