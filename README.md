
UIView helper category to add animation on addSubview & removeFromSuperView with one method. Uses facebook pop. Doesn't play well with AutoLayout.

Easy peasy.

Basic animations can be used to interpolate values over a specified time period. To use an ease-in ease-out animation to animate a view's alpha from 0.0 to 1.0 over the default duration:
```objective-c
[self.view addSubview:self.viewToAdd withAnimationType:MotionTypeSlideInFromLeft];

[self.view removeFromSuperViewWithAnimationType:MotionTypeSlideOutToLeft];
```

Optional delay, completionBlock parameters are also available.


Disclaimer:
When using delay, the UIView won't be added/removed to/from the view hierarchy until the specified time.
Don't even try to make it work with AutoLayout :)



## Animation types

A collection of links to external resources that may prove valuable:

* FadeIn
* FadeOut

* SlideInFromLeft
* SlideInFromRight
* SlideInFromTop
* SlideInFromBottom
* SlideInFromBottomAndFadeIn

* SlideOutToLeft
* SlideOutToRight
* SlideOutToTop
* SlideOutToBottom

* ZoomIn
* ZoomOut


## Contributing
Pull requests are welcome!

## License

UIView+Motion is released under a MIT License. See LICENSE file for details.