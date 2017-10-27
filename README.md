# RxASControlEvent

[![CI Status](http://img.shields.io/travis/Geektree0101/RxASControlEvent.svg?style=flat)](https://travis-ci.org/Geektree0101/RxASControlEvent)
[![Version](https://img.shields.io/cocoapods/v/RxASControlEvent.svg?style=flat)](http://cocoapods.org/pods/RxASControlEvent)
[![License](https://img.shields.io/cocoapods/l/RxASControlEvent.svg?style=flat)](http://cocoapods.org/pods/RxASControlEvent)
[![Platform](https://img.shields.io/cocoapods/p/RxASControlEvent.svg?style=flat)](http://cocoapods.org/pods/RxASControlEvent)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```swift
    let button = ASButtonNode()

    button.rx.event(.touchUpInside).subscribe(onNext: { _ in
        print("Touch up inside")
    }).disposed(by: disposeBag)
        
    button.rx.event(.touchUpOutside).subscribe(onNext: { _ in
        print("Touch up outside")
    }).disposed(by: disposeBag)

    button.rx.event(TOUCH_EVENT_TYPE).subscribe(onNext: { BUTTON_NODE in
        // TODO:
    }).disposed(by: disposeBag)

    let text = ASTextNode()

    text.rx.event(.allEvents).subscribe(onNext: { _ in
        print("Also, TextNode can do it!")
    }).disposed(by: disposeBag)
```

BUTTON_NODE is ASButtonNode

TOUCH_EVENT_TYPE
```objc
        typedef NS_OPTIONS(NSUInteger, ASControlNodeEvent)
        {
            /** A touch-down event in the control node. */
            ASControlNodeEventTouchDown         = 1 << 0,
            /** A repeated touch-down event in the control node; for this event the value of the UITouch tapCount method is greater than one. */
            ASControlNodeEventTouchDownRepeat   = 1 << 1,
            /** An event where a finger is dragged inside the bounds of the control node. */
            ASControlNodeEventTouchDragInside   = 1 << 2,
            /** An event where a finger is dragged just outside the bounds of the control. */
            ASControlNodeEventTouchDragOutside  = 1 << 3,
            /** A touch-up event in the control node where the finger is inside the bounds of the node. */
            ASControlNodeEventTouchUpInside     = 1 << 4,
            /** A touch-up event in the control node where the finger is outside the bounds of the node. */
            ASControlNodeEventTouchUpOutside    = 1 << 5,
            /** A system event canceling the current touches for the control node. */
            ASControlNodeEventTouchCancel       = 1 << 6,
            /** A system event triggered when controls like switches, slides, etc change state. */
            ASControlNodeEventValueChanged      = 1 << 12,
            /** A system event when the Play/Pause button on the Apple TV remote is pressed. */
            ASControlNodeEventPrimaryActionTriggered = 1 << 13,
            
            /** All events, including system events. */
            ASControlNodeEventAllEvents         = 0xFFFFFFFF
        };
```

## Requirements

## Installation

RxASControlEvent is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RxASControlEvent'
```

## Author

Geektree0101, h2s1880@gmail.com

## License

RxASControlEvent is available under the MIT license. See the LICENSE file for more info.
