class FormController < BaseController

	# POST /form
	# POST /form.json
	def create
		realPerson = params[:realPerson]
		realPersonHash = params[:realPersonHash]
		
	    if !realPerson.nil? && !realPersonHash.nil? && Integer(rpHash(realPerson)) == Integer(realPersonHash)
			
			# Accepted
		else 
			# Rejected
		end
		
	end

private 

	def rpHash (defaultReal)
		hash = 5381
		if !defaultReal.nil?
			defaultReal.upcase!
			defaultReal.length.times{ |i| hash = ((shift_32 hash, 5) + hash) + defaultReal[i].ord }
		end
		return hash
	end
	
	def shift_32 x, shift_amount
	  shift_amount &= 0x1F
	  x <<= shift_amount
	  x &= 0xFFFFFFFF 
	
	  if (x & (1<<31)).zero?
	   x
	  else
	   x - 2**32
	  end
	end

end