//
//  ViewController.swift
//  RxASControlEvent
//
//  Created by Geektree0101 on 10/28/2017.
//  Copyright (c) 2017 Geektree0101. All rights reserved.
//

import AsyncDisplayKit
import RxSwift
import RxCocoa
import RxASControlEvent

class ViewController: ASViewController<ASDisplayNode> {

    let disposeBag = DisposeBag()
    
    init() {
        let viewNode = ASDisplayNode()
        viewNode.backgroundColor = .white
        super.init(node: viewNode)
        self.createTextButton()
    }
    
    func createTextButton() {
        // Create Button
        let button = ASButtonNode()
        let fontKey = NSAttributedStringKey.font
        let colorKey = NSAttributedStringKey.foregroundColor
        let attributedText = NSAttributedString(string: "Touch",
                                                attributes: [fontKey: UIFont.systemFont(ofSize: 20.0),
                                                             colorKey: UIColor.white])
        button.setAttributedTitle(attributedText, for: .normal)
        button.backgroundColor = .gray
        button.style.minSize = CGSize(width: 200.0, height: 200.0)
        self.node.layoutSpecBlock = { (_, _) -> ASLayoutSpec in
            let insets = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
            return ASInsetLayoutSpec(insets: insets, child: button)
        }
        
        // Rx
        button.rx.event(.touchUpInside).subscribe(onNext: { _ in
            print("Touch up inside")
        }).disposed(by: disposeBag)
        
        button.rx.event(.touchUpOutside).subscribe(onNext: { _ in
            print("Touch up outside")
        }).disposed(by: disposeBag)
        
        button.rx.event(.touchDragInside).subscribe(onNext: { buttonNode in
            buttonNode.backgroundColor = .red
            print("Touch Drag Inside -> Fill Red on Button")
        }).disposed(by: disposeBag)
        
        /*
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
        };*/
        
        self.node.addSubnode(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

