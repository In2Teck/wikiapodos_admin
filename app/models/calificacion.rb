class Calificacion < ActiveRecord::Base
belongs_to :apodo
belongs_to :usuario, :primary_key => :facebook_id
  attr_accessible :apodo_id, :calificacion, :fecha_actualizacion, :fecha_creacion, :usuario_id
end
