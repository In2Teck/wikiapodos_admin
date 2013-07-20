class Usuario < ActiveRecord::Base
has_many :apodos_para, :class_name => "ApodosUsuario", :foreign_key => :usuario_para_id, :primary_key => :facebook_id
has_many :apodos_desde, :class_name => "ApodosUsuario", :foreign_key => :usuario_desde_id, :primary_key => :facebook_id
has_many :reportes, :primary_key => :facebook_id
has_many :calificaciones, :primary_key => :facebook_id
has_many :apodos, :primary_key => :facebook_id, :foreign_key => :autor_id
has_many :compartidos, :primary_key => :facebook_id
  attr_accessible :apellido, :email, :es_fan, :facebook_id, :fecha_actualizacion, :fecha_creacion, :nombre
end
