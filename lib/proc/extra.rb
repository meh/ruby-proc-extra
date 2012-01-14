#--
#           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                   Version 2, December 2004
#
#           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#  TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#++

class Proc
	def to_lambda
		obj = Object.new
		obj.define_singleton_method(:_, &self)

		obj.method(:_).to_proc
	end

	def << (*args)
		first = self

		proc {|*args2|
			instance_exec(*args, *args2, &first)
		}
	end

	def | (second)
		first = self

		proc {|*args|
			instance_exec(*args, &first) || instance_exec(*args, &second)
		}
	end

	def & (second)
		first = self

		proc {|*args|
			instance_exec(*args, &first) && instance_exec(*args, &second)
		}
	end

	def + (second)
		first = self

		proc {|*args|
			instance_exec(instance_exec(*args, &second), &first)
		}
	end
end
