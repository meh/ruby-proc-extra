#! /usr/bin/env ruby
require 'rubygems'
require 'proc/extra'

describe Proc do
	describe '#to_lambda' do
		it 'returns true to #lambda?' do
			proc { }.to_lambda.lambda?.should be_true
		end

		it 'makes return work' do
			expect { proc { return }.call }.should raise_error
			expect { proc { return }.to_lambda.call }.should_not raise_error
		end
	end
end
