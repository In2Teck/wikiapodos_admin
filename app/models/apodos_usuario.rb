class ApodosUsuario < ActiveRecord::Base
belongs_to :apodo
belongs_to :usuario_para, :class_name => "Usuario", :primary_key => :facebook_id, :foreign_key => :usuario_para_id
belongs_to :usuario_desde, :class_name => "Usuario", :primary_key => :facebook_id, :foreign_key => :usuario_desde_id
  attr_accessible :apodo_id, :fecha_actualizacion, :fecha_creacion, :status, :usuario_desde_id, :usuario_para_id, :visible
end
