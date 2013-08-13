class CreateCuerpos < ActiveRecord::Migration
  def change
    if not ActiveRecord::Base.connection.table_exists? 'cuerpos' and Rails.env != "admin"
      create_table :cuerpos do |t|
        t.string :descripcion
        t.string :imagen_url
        t.datetime :fecha_creacion
        t.datetime :fecha_actualizacion
      end
    end
  end
end
