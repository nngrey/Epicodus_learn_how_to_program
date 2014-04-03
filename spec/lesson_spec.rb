require 'spec_helper'

describe Lesson do
  it { should validate_presence_of :name }
  it { should validate_presence_of :number }

  context '#next' do
    it 'returns the lesson with the next-highest number than the current lesson' do
      current_lesson = Lesson.create({:name => 'lesson1', :number => 1})
      next_lesson = Lesson.create({:name => 'lesson2', :number => 2})
      current_lesson.next.should eq next_lesson
    end
  end

  context '#previous' do
    it 'returns the lesson with the next-lowest number than the current lesson' do
      current_lesson = Lesson.create({:name => 'lesson4', :number => 4})
      previous_lesson = Lesson.create({:name => 'lesson3', :number => 3})
      current_lesson.previous.should eq previous_lesson
    end
  end

  describe '.number_order' do
    it 'updates lesson numbers to maintain sequential order when any lesson is deleted' do
      lesson_one = Lesson.create({:name => 'lesson1', :number => 1})
      lesson_two = Lesson.create({:name => 'lesson2', :number => 2})
      lesson_three = Lesson.create({:name => 'lesson3', :number => 3})
      lesson_two.destroy
      Lesson.number_order
      # Lesson.find_by(:name => 'lesson3').number.should eq 2
      Lesson.all[1].number.should eq 2
    end
  end
end
