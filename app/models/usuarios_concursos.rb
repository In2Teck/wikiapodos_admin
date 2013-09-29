class UsuariosConcursos < ActiveRecord::Base
belongs_to :apodo
belongs_to :usuario
self.created_timestamp = :fecha_creacion
end