require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')
require_relative('./models/house')
require_relative('./models/student')

get('/students') do
   @students = Student.all_with_house
   erb(:students)
end

get('/students/new') do
  @houses = House.all()
  erb(:new_student)
end

post('/students') do
  student = Student.new(params)
  student.save()
end

get('/houses') do
  @houses = House.all()
  erb(:houses)
end
