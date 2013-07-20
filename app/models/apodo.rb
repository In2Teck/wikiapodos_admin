class Apodo < ActiveRecord::Base
belongs_to :usuario, :primary_key => :facebook_id, :foreign_key => :autor_id
has_many :reportes
has_many :compartidos
has_many :apodos_usuarios
has_many :calificaciones
  attr_accessible :autor_id, :calificacion, :descripcion, :destacado, :fecha_actualizacion, :fecha_creacion, :imagen_url, :nombre, :prefijo, :visible
end
