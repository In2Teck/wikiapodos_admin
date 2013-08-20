class Imagen < ActiveRecord::Base
belongs_to :objeto
belongs_to :cuerpo
  attr_accessible :cuerpo_id, :fecha_actualizacion, :fecha_creacion, :imagen_url, :objeto_id

  self.created_timestamp = :fecha_creacion
  self.updated_timestamp = :fecha_actualizacion
end
