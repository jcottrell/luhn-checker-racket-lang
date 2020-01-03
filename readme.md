# Luhn Checker
Simple app to explore apps in Racket.

## Compiling
1. Open Luhn.rkt in DrRacket
1. From the DrRacket menu select Racket > Create Executable...
1. Type: Distribution (to install on other machines) 
1. Base: GRacket
1. Files for icons, etc.: add luhncheck.icns
1. Click Create

## Notes
Andres Ramos - video: [TheRacketChannel#3 - Making GUIś](https://www.youtube.com/watch?v=yo6wVXS6dkU)  
Racket - [1.11 Creating Executables](https://docs.racket-lang.org/drracket/create-exe.html)  
[Racket GUI](https://docs.racket-lang.org/gui/index.html)  
[BrandCrowd for free icon design](https://www.brandcrowd.com/maker/tag/simple) - Scam? Unnecessary?  
[Image2Icon](http://www.img2icnsapp.com/) - mac app for image to ".icns" file creation  

## TODOs
+ Add testing file to test internals of luhn-guts.rkt
+ Improve layout and aesthetics, especially result placement, button placement, and result style, font, background
+ Add instructions and possibly examples to app

## Using the app
Enter a credit card number and click Validate or hit Enter and the app will tell you whether or not the number is valid according to the Luhn algorithm.
