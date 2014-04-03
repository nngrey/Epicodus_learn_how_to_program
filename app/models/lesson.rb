class Lesson < ActiveRecord::Base
  belongs_to :section
  validates :name, :presence => true
  validates :number,
            :presence => true,
            :uniqueness => true


  def next
    Lesson.find_by(:number => self.number + 1)
  end

  def previous
    Lesson.find_by(:number => self.number - 1)
  end

  def self.number_order
    lessons = Lesson.all.sort_by {|lesson| lesson.number }
    lessons.each_with_index do |lesson, index|
      if lesson.number != index + 1
         lesson_to_update = Lesson.find(lesson.id)
         lesson_to_update.update(:number => index + 1)
      end
    end
  end

end
