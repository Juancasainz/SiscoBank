
class MyValidator < ActiveModel::Validator ##El SUPER validador
  def validate(record)
    unless record.tlf1.start_with? '0'
      record.errors.add "El telefono" , " debe comenzar con 0"
    end
    if record.vencimiento.present? && record.vencimiento < Date.today
      record.errors.add(:vencimiento, "Su identificacion esta vencida.")
    end
    if record.emision.present? && record.emision > Date.today
      record.errors.add(:emision, "Vienes del futuro? :o")
    end
    if !record.ids.split('-')[1].present?
      record.errors.add(:ids, "Su identificacion es requerida. ")
    end
    unless record.correo =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors.add(:correo, "Introduzca un correo valido.")
    end
  end
end



class User < ApplicationRecord

#Aui se realizan las validaciones

	validates :nombre, presence: true, 
		format: { with: /\A[a-zA-ZñíéáóúÑ ]+\z/,
    message: "solo permite letras."}

  validates :tlf1, presence: true,  
    numericality: { only_integer: true, message:'solo acepta numeros'}

	validates :tlf2, allow_nil: true,  
    numericality: { only_integer: true, message:'solo acepta numeros',
    :allow_blank => true}

	validates_presence_of :correo, :vencimiento, :emision, :ids

	validates_with MyValidator

end
