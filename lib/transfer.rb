class Transfer
	attr_reader(:name)
	attr_accessor(:sender, :receiver, :status, :amount)

	def initialize(sender, receiver, status="pending", amount)
		@sender 	= sender
		@receiver 	= receiver
		@status 	= status
		@amount 	= amount
	end

	def valid?
		#check valid method form BankAccount class for each new instance
		#return true or false
		sender.valid? && receiver.valid?
	end
	
	def execute_transaction
		#if valid passes, check that the senders balance is greater than amount to transfer & status isn't already complete
		if valid? && sender.balance > amount && status != "complete"
			#set status complete
			@status = "complete"
			#adjust the balances of each by altering the amount
			sender.balance = sender.balance - amount
		
			receiver.balance = receiver.balance + amount
		else
			#set status rejected
			@status = "rejected"
			"Transaction rejected. Please check your account balance."
		end

	end

	def reverse_transfer
		# check if both instances are valid, the senders balance is greater than the amount, and the transfer has already passed
		if valid? && sender.balance > amount && status == "complete"
			#set status to reversed
			@status = "reversed"
			#undo changes from the original transfer
			receiver.balance = receiver.balance - amount
			sender.balance = sender.balance + amount
		else
			@status = "rejected"
			"Transfer rejected. Please check your account balance."
		end		
	end
end
