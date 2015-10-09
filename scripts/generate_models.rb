#!/usr/bin/ruby

puts 'Generating models'
`mogenerator -m 'Preloaded Database/Models/Model.xcdatamodeld' -O 'Preloaded Database/Models' --template-var arc=true`
