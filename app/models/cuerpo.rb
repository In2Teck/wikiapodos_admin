class Cuerpo < ActiveRecord::Base
has_many :imagenes
  attr_accessible :descripcion, :fecha_actualizacion, :fecha_creacion, :imagen_url
end
