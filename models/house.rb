require_relative('./../helpers/helper')

class House

    attr_reader :id, :name, :logo

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i() if options['id']
    @logo = options['logo']
  end

  def save()
    if @id
      update()
    else
      insert()
    end
  end



  def House.house_by_name(name)
    return Helper.run_sql_and_map("SELECT id, name, logo FROM houses WHERE houses.name = $1", [name], House)[0]
  end

  def House.house_by_id(id)
    return Helper.run_sql_and_map("SELECT id, name, logo FROM houses WHERE houses.id = $1", [id], House)[0]
  end

  def House.all()
    return Helper.run_sql_and_map("SELECT * FROM houses" , [], House)
  end


  private
  def insert()
    sql = "INSERT INTO houses (name, logo) VALUES ($1, $2) RETURNING id"
    @id = Helper.sql_run(sql, [@name, @logo])[0]['id']
  end

  def update()
    sql = "UPDATE houses SET name = $1, logo = $2 WHERE id = $3"
    Helper.sql_run(sql, [@name, @logo, @id])
  end

end
