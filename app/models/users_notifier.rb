class UsersNotifier
  attr_reader :ids

  def initialize(ids)
    @ids = ids
  end

  def notify
    User.find_each do |user|
      NotifyUsersMailer.send_email(user.email, ids).deliver_later if check_data
    end
  end

  private

  def check_data
    ids.size > 1
  end
end