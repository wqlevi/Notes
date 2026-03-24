# Performance of python code
## Basic conventions
1. Avoid plug in global variable     functions/ variables in a loop;
2. Use `"".join()`     instead of 'string' + 'string', or use formatting of string
3. Import module always outside     the function, but at beginning(global) area of class
4. Unpacking arguments: `ls = ['apple','egg','banana']` apply each element in a function`func(*ls)` or packing arguments`_,*x,_ = ['first','sencond','third','forth']` then `print(x)` gives `['sencond','third']`
5. Similar manner apply on dictionary, when unpacking arguments stored in dictionary for function:
~~~python
def func(stat,temporature='20'):
	print(stat,'corresponds', temporature)
dt = {'stat':'feaver','temporature':'39'}
func(**dt)
>>> feavor corresponds 39
~~~

## Evaluation of performance

Timer for functions: s
~~~python
t = timeit.Timer(setup = 'from __main__ import funname', stmt = 'funname()')
t.timeit()
~~~
Profile for functions:
~~~python
import profile
porfile.run(funcationName())	
# this returns iteration per built-in function, and its timming
~~~

Garbage collection: (*unused but allocated object*)
~~~python
import gc
n = gc.collect()
print("Num of unreachable objects: ",n) # e.g. num of empty ref. list
print("Uncollectable garbage: ",gc.garbage) # e.g. empty ref. list
~~~
## Debugging
* Break points 
	This allow you to assure values before the break points are OK
	And, you can set two break point(say a loop block) to inspect variable value change per iteration
	
	

