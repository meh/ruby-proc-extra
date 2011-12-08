proc-extra - add some methods to Proc
=====================================

This gem provides some additional methods to proc

`#to_lambda` converts a Proc into a lambda

`#| (other)` returns a Proc that does something on the lines of `self.call || other.call`

`#& (other)` returns a Proc that does something on the lines of `self.call && other.call`
