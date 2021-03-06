Guess the Polynomial
========================================================
author: Olaf Janssen
date: 20 December 2014

The Why
========================================================

- Do you ever lie awake at night doubting your sense of coefficients? 
- Do fitting algorithms make you feel dumb?
- Do you want to finish your Coursera data science specialization?

Then this `shiny` web-app might be for you!

The How
========================================================

The web-app will present you with a random 3rd order polynomial with some noise to make things a little more interesting:


```r
# Set up the curve to guess
coefs <- runif(4,-5, 5)
noise <- 50 * rnorm(1000);
x <- runif(1000, -5, 5)
y <- coefs[1] + coefs[2]*x + coefs[3]*x^2 + coefs[4]*x^3 + noise
```

The What
========================================================

It will present you with something like this: now it's your task to slide around sliders guessing the coefficients of the polynomial to best fit this curve.

![plot of chunk unnamed-chunk-2](guess-the-poly-figure/unnamed-chunk-2-1.png) 

You're not alone in it though. The app presents you with the RMS error between your chosen polynomial and the data.


The End
========================================================

Future work to make this app a true gem:

- variable number of coefficients (order of the polynomial)
- multiple difficulty levels
- notification when best fit has indeed been found


