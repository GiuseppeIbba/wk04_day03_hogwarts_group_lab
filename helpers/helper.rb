require('pg')

class Helper

  def Helper.sql_run(sql, values = [])
    db = PG.connect({dbname: 'hogwarts', host: 'localhost'})
    db.prepare("query", sql)
    result = db.exec_prepared("query", values)
    db.close()
    return result
  end

  def Helper.map_object(array, classname)
    return array.map {|item| classname.new(item)}
  end

  def Helper.run_sql_and_map(sql, values, classname)
    return Helper.map_object(Helper.sql_run(sql, values), classname)
  end

end
