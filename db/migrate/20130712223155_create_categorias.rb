class CreateCategorias < ActiveRecord::Migration
  def change
    if not ActiveRecord::Base.connection.table_exists? 'categorias' and Rails.env != "admin"
      create_table :categorias do |t|
        t.string :descripcion
        t.string :imagen_url
        t.datetime :fecha_creacion
        t.datetime :fecha_actualizacion
      end
    end
  end
end
