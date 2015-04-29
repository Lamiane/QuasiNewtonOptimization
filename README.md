# QuasiNewtonOptimization
code for Mathematical Optimization with algorithm for quasi-Newton pptimization using BFGS and DFP formula

You'll need Octave/Matlab for this one.

short tutorial
>>> dim = [2, 1]
>>> vnn(@convex, dim, @DFP, 1000)
>>> vnn(@convex, dim, @BFGS, 1000)
>>> vnn(@rossenbrock, dim, @DFP, 5)
>>> vnn(@rossenbrock, dim, @BFGS, 5)

@convex, @rossenbrock - functions to be optimised
dim - its dimensions. Let's say you have F:RxR -> R, then the dimensions are [2, 1]
@BFGS - update formula
1000 - optional argument providing number of iterations. 100 is the default.
