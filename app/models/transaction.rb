class Transaction < ApplicationRecord
  belongs_to :user

  belongs_to :fromcurrency, class_name: 'Currency', foreign_key: 'from_currency'
  belongs_to :tocurrency, class_name: 'Currency', foreign_key: 'to_currency'

  validates_presence_of :from_amount, :to_amount, :message => " can not be empty"

  validates_numericality_of :from_amount,:to_amount, :greater_than => 0

  validate :cannot_use_the_same_currency
  



  private

  def cannot_use_the_same_currency
    errors.add(:from_currency, 'You cannot use the same currency in one transaction.') if from_currency == to_currency
  end

end
