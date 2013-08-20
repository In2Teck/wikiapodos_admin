class Categoria < ActiveRecord::Base
has_many :objetos
  attr_accessible :descripcion, :fecha_actualizacion, :fecha_creacion, :imagen_url
  
  self.created_timestamp = :fecha_creacion
  self.updated_timestamp = :fecha_actualizacion
end
