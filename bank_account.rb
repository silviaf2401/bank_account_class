class BankAccount
	#allow instance variables to be set/accessed
	attr_accessor :account_number, :checking_account_balance, :savings_account_balance, :interest_rate
	
	#create a class variable, to keep track of the number of accounts the bank has.
	#we could have created this in a Bank class. 
	@number_of_accounts = 0

	class << self
		#share number_of_accounts variable across instances and allow it to be set/accessed
		attr_accessor :number_of_accounts
	end

	#create our constructor method for bank account instances
	def initialize
		#call generate_account_number method to create account # for each new account. 
		#One account number per checking/savings pair only.
		generate_account_number
		#initialize instance variables
		@savings_account_balance = 0
		@checking_account_balance = 0
		@interest_rate = 0.02
		#increment count of number of accounts
		self.class.number_of_accounts += 1
	end
	def generate_account_number
		#random integer from 1 to 50000
		@account_number = rand(1..50000)
	end
	def display_account_number
		#print account number when called
		puts @account_number
	end
	def display_number_accounts
		#prints how many accounts the bank has so far
		puts "The bank has #{self.class.number_of_accounts} accounts so far"
	end
	def deposit(amount, account_type)
		#allow users to deposit an amount into account type, if account type is savings/checking:
		# increase balance in savings/checking account by the amount desired
		#and print message stating where deposit was made 
		if account_type == "savings"
			@savings_account_balance += amount
			puts "You've deposited #{@amount} into your savings account"
		else
			@checking_account_balance += amount
			puts puts "You've deposited #{@amount} into your checking account"
		end
	end
	def withdraw(amount, account_type)
		#allow users to withdraw amount from given account type
		#compare amount requested with account balance 
		#if balance is too low, display error message asking user to withdraw a smaller amount, otherwise update account balance and display confirmation message
		if account_type == "savings"
			if amount <= @savings_account_balance
				@savings_account_balance -= amount
				puts "You've withdrawn #{@amount} from your savings account"
				puts "Your new savings account balance is #{@savings_account_balance}"
			else
				puts "Your balance is too low. Please try withdrawing a smaller amount or withdrawing from your checking account."
			end
		else
			if amount <= @checking_account_balance
				@checking_account_balance -= amount
				puts "You've withdrawn #{@amount} from your checking account"
				puts "Your new checking account balance is #{@checking_account_balance}"
			else
				puts puts "Your balance is too low. Please try withdrawing a smaller amount or withdrawing from your savings account."
			end
		end
	end
	def display_account_information
		#display account information
		puts "Your account number is: #{@account_number}"
		puts "Your total balance is: #{@checking_account_balance + @savings_account_balance*(1+@interest_rate)}"
		puts "Your checking account balance is: #{@checking_account_balance}"
		puts "Your savings account balance is: #{@savings_account_balance*(1+@interest_rate)}"
		puts "The interest rate we're giving you on your savings account is: #{@interest_rate}"
	end
	def display_balances
		#display balances for each account and total balances
		puts "Your checking account balance is: #{@checking_account_balance}"
		puts "Your savings account balance is: #{@savings_account_balance*(1+@interest_rate)}"
		puts "Your total balance is: #{@checking_account_balance + @savings_account_balance*(1+@interest_rate)}"
	end
	def display_checking_account_balance
		#print checking account balance when called
		puts "Your checking account balance is: #{@checking_account_balance}"
	end
	def display_savings_accountbalance
		#print savings account balance when called
		puts "Your savings account balance is: #{@savings_account_balance}"
	end
	
	private :generate_account_number

end

