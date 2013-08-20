class Reportes < ActiveRecord::Base
belongs_to :apodo
belongs_to :usuario, :primary_key => :facebook_id
  attr_accessible :apodo_id, :fecha, :fecha_actualizacion, :fecha_creacion, :razon, :usuario_id

  self.created_timestamp = :fecha_creacion
  self.updated_timestamp = :fecha_actualizacion
end
