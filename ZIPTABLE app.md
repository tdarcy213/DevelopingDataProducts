Generate a table of ZIP codes that are within a specified distance of another ZIP code!
===
Coursera / Johns Hopkins University

Developing Data Products

December, 2014


Why ZIPs?
========================================================
ZIP codes are used for more than routing mail deliveries.
Important business functions include:

- Statistical Overlays
- Targeted Marketing
- Demographic Overlays
- Census Data

With the ZIPTABLE app, you can easily generate a table of
ZIP codes that are within a specified distance of another
ZIP code!

A simple data frame, and a simple algorithm!
========================================================
We use the R "zipcode" data:

```
'data.frame':	44336 obs. of  5 variables:
 $ zip      : chr  "00210" "00211" "00212" "00213" ...
 $ city     : chr  "Portsmouth" "Portsmouth" "Portsmouth" "Portsmouth" ...
 $ state    : chr  "NH" "NH" "NH" "NH" ...
 $ latitude : num  43 43 43 43 43 ...
 $ longitude: num  -71 -71 -71 -71 -71 ...
```

```
    zip       city state latitude longitude
1 00210 Portsmouth    NH    43.01    -71.01
2 00211 Portsmouth    NH    43.01    -71.01
3 00212 Portsmouth    NH    43.01    -71.01
```

A little Mathematical Magic!
========================================================

And we apply this alogrithm:

$sqrt((69.1*(lat1-lat))^2+(69.1*(long1-long)*cos(lat/57.3))^2)$

Thank YOU, Pythagoras!

And this is the result!
========================================================
![alt-text](./instructions_files/figure-html/ui2.png)

See it here: https://tgddatascience.shinyapps.io/ZIPTABLE/
