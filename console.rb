require_relative('./models/house')
require_relative('./models/student')

gryffindor = House.new({'name' => 'Gryffindor', 'logo' => 'https://vignette.wikia.nocookie.net/harrypotter/images/e/ee/Gryffindor_Crest-0.jpg/revision/latest/scale-to-width-down/162?cb=20160729145529'})
gryffindor.save()
ravenclaw = House.new({'name' => 'Ravenclaw'})
ravenclaw.save()
hufflepuff = House.new({'name' => 'Hufflepuff'})
hufflepuff.save()
slytherin = House.new({'name' => 'Slytherin'})
slytherin.save()

gryffindor = House.house_by_name('Gryffindor')
ravenclaw = House.house_by_name('Ravenclaw')
hufflepuff = House.house_by_name('Hufflepuff')
slytherin = House.house_by_name('Slytherin')

harry_potter = Student.new({'first_name' => 'Harry', 'second_name' => 'Potter', 'age' => '10', 'house_id' => gryffindor.id})
harry_potter.save()

luna = Student.new({'first_name' => 'Luna', 'second_name' => 'Lovegood', 'age' => '14', 'house_id' => ravenclaw.id})
luna.save()

eric = Student.new({'first_name' => 'Eric', 'second_name' => 'Charles', 'age' => '31', 'house_id' => ravenclaw.id})
eric.save()

giuseppe = Student.new({'first_name' => 'Giuseppe', 'second_name' => 'Ibba', 'age' => '28', 'house_id' => gryffindor.id})
giuseppe.save()

amy = Student.new({'first_name' => 'Amy', 'second_name' => 'Morrison', 'age' => '10', 'house_id' => hufflepuff.id})
amy.save()

peter = Student.new({'first_name' => 'Peter', 'second_name' => 'Griffin', 'age' => '50', 'house_id' => slytherin.id})
peter.save()

iva = Student.new({'first_name' => 'Iva', 'second_name' => 'Menzies', 'age' => '22', 'house_id' => hufflepuff.id})
iva.save()

manny = Student.new({'first_name' => 'Manny', 'second_name' => 'Chita', 'age' => '59', 'house_id' => slytherin.id})
manny.save()


p Student.all().count

p Student.find_by_id(harry_potter.id)
