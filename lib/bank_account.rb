class BankAccount
	attr_reader(:name)
	attr_accessor(:balance, :status)

	def initialize(account_name, balance=1000, status="open")
		@name = account_name
		@balance = balance
		@status = status
	end
	
	def deposit(amount)
		#can deposit money into its account
		@balance = @balance + amount.to_i
	end
	
	def display_balance
		"Your balance is $#{@balance}."
	end

	def valid?
		if @balance > 0 && @status == "open"
			true
		else
			self.status = "closed"
			false
		end
	end

	def close_account
		#something
		self.status = "closed"
	end
end