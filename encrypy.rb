# encoding: utf-8

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require 'digest'

puts "Введите фразу для шифрования"
string = STDIN.gets.chomp

encrypt_method=''

until ([1,2,3].include?(encrypt_method)) do
  puts "\nКаким способом зашифровать:\n1. MD5\n2. SHA1\n3. SHA2"
  encrypt_method = STDIN.gets.chomp.to_i
end

puts "Результат шифрования:"

case encrypt_method
  when 1
    puts Digest::MD5.hexdigest(string)
  when 2
    puts Digest::SHA1.hexdigest(string)
  when 3
    puts Digest::SHA2.hexdigest(string)
end