class CreateCalificaciones < ActiveRecord::Migration
  def change
    if not ActiveRecord::Base.connection.table_exists? 'calificaciones' and Rails.env != "admin"
      create_table :calificaciones do |t|
        t.string :usuario_id
        t.integer :apodo_id
        t.integer :calificacion
        t.datetime :fecha_creacion
        t.datetime :fecha_actualizacion
      end
    end
  end
end
