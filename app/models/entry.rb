class Entry < ActiveRecord::Base
  belongs_to :user

  validates :started_at,  presence: true
  validates :user_id,     presence: true
  validate  :end_time_possible?

  def running?
    ended_at.present?
  end


  def end_time_possible?
    return true if (ended_at.blank? || started_at.blank?)

    if (ended_at < started_at)
      errors.add(:ended_at, 'must be greater than the start time')
    end
  end

end
