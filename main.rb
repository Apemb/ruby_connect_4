console = IO.new STDOUT.fileno
console.puts 'coucou'
console.puts 'Kes c ton blaz ?'
name = console.gets.chomp
console.puts "SalU #{name}!"
