class CreateImagenes < ActiveRecord::Migration
  def change
    if not ActiveRecord::Base.connection.table_exists? 'imagenes' and Rails.env != "admin"
      create_table :imagenes do |t|
        t.integer :cuerpo_id
        t.integer :objeto_id
        t.string :imagen_url
        t.datetime :fecha_creacion
        t.datetime :fecha_actualizacion
      end
    end
  end
end
