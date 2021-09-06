class Project < ApplicationRecord
    enum status: [:propuesta, :en_progreso, :terminado]
    validates :name, :description, :status, :initial_date, :finish_date, presence: true
end
