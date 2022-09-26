#json.extract! transaction, :id, :user_id, :from_amount, :from_currency, :to_amount, :to_currency, :created_at, :updated_at
#json.url transaction_url(transaction, format: :json)


json.transaction do
  json.id @transaction.id
  json.user @transaction.user.name
  json.amount_from @transaction.from_amount
  json.currency_from @transaction.fromcurrency.name
  json.amount_to @transaction.to_amount
  json.currency_to @transaction.tocurrency.name
  json.date @transaction.created_at
end