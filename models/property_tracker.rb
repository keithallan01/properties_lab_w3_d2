require('pg')
require('pry')

class PropertyTracker
attr_accessor :address, :value, :bedrooms, :year_built
attr_reader :id


    def initialize(options)
      @id = options['id'].to_i if options['id']
      @address = options['address']
      @value = options['value']
      @bedrooms = options['bedrooms']
      @year_built = options['year_built'].to_i
    end


    def save()
      db = PG.connect({ dbname: 'property_tracker', host: 'localhost' })
      sql = "INSERT INTO properties
            (address, value, bedrooms, year_built)
            VALUES
            ($1, $2, $3, $4)
            RETURNING *"

            values = [@address, @value, @bedrooms, @year_built]
            db.prepare("save", sql)
            @id = db.exec_prepared("save", values)[0]['id'].to_i
            db.close()
    end

    def PropertyTracker.all

      db = PG.connect({ dbname: 'property_tracker', host: 'localhost' })

      sql = "SELECT * FROM properties"


      db.prepare("all", sql)
      properties = db.exec_prepared("all")

      db.close()
      return properties.map { |property| PropertyTracker.new(property)}

    end
    def delete()
      db = PG.connect({ dbname: 'property_tracker', host: 'localhost' })

      sql = "DELETE FROM properties
            WHERE id = $1"
      values = [@id]
      db.prepare("delete_one", sql)

      db.exec_prepared("delete_one", values)

      db.close()
    end

    def update()
      db = PG.connect({ dbname: 'property_tracker', host: 'localhost' })

      sql = "UPDATE properties SET
      (address, value, bedrooms, year_built)
      = ($1, $2, $3, $4) WHERE id = $5"

      values = [@address, @value, @bedrooms, @year_built, @id]
      db.prepare("update", sql)
      db.exec_prepared("update", values)
      db.close()
    end

    def PropertyTracker.find_address()
      db = PG.connect({ dbname: 'property_tracker', host: 'localhost' })
      sql = "SELECT address FROM properties WHERE address = $1"

      db.prepare("find_address", sql)
      db.exec_prepared("find_address")
      db.close()
    end

    def PropertyTracker.find_id(id)
      db = PG.connect({ dbname: 'property_tracker', host: 'localhost' })
      sql = "SELECT * FROM properties WHERE id = $1"
      values = [id]
      db.prepare("find_id", sql)
      db.exec_prepared("find_id", values)
      db.close()
    end



    def PropertyTracker.delete_all()
      db = PG.connect({ dbname: 'property_tracker', host: 'localhost' })
      sql = "DELETE FROM properties"
      db.prepare("delete_all", sql)
      db.exec_prepared("delete_all")
      db.close()

    end



end
