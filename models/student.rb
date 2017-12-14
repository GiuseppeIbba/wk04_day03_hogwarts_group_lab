require_relative('./../helpers/helper')
class Student

  attr_reader :first_name, :second_name, :age, :house_id, :id, :house_name

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @first_name = options['first_name']
    @second_name = options['second_name']
    @age = options['age'].to_i
    @house_id = options['house_id'].to_i if options['house_id']
    @house_name = options['house_name'] if options['house_name']
  end

  def save()
    if @id
      update()
    else
      insert()
    end
  end

  def house()
      sql = "SELECT * FROM houses WHERE houses.id = $1"
      return Helper.run_sql_and_map(sql,[@house_id], House)
  end

  def self.all()
    sql = "SELECT *
    FROM students"
    return Helper.run_sql_and_map(sql,[], Student)
  end

  def self.all_with_house
    sql = "SELECT students.*, houses.name as house_name FROM students
    INNER JOIN houses ON
    students.house_id = houses.id"
    return Helper.run_sql_and_map(sql,[], Student)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM students WHERE id = $1"
    return Helper.run_sql_and_map(sql,[id], Student).first()
  end

  private
  def insert()
    sql = "INSERT INTO students (first_name, second_name, age, house_id) VALUES ($1, $2, $3, $4) RETURNING id"
    @id = Helper.sql_run(sql, [@first_name, @second_name, @age, @house_id])[0]['id']
  end


  def update()
    sql = "UPDATE students SET (first_name, second_name, age, house_id) VALUES ($1, $2, $3, $4) WHERE id = $5"
    Helper.sql_run(sql, [@first_name, @second_name, @age, @house_id,@id])
  end





end
