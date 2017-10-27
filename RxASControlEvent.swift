//
//  ASControlEvent+Rx.swift
//
//  Created by Geektree0101 on 10/28/17.
//  Copyright(C) 2017 Hyeonsu Ha. All rights reserved.
//

import AsyncDisplayKit
import RxSwift
import RxCocoa

// This should be only used from `MainScheduler`
final class ASControlTarget<Control: ASControlNode>: _RXKVOObserver, Disposable {
    typealias Callback = (Control) -> Void
    
    let selector = #selector(eventHandler(_:))
    
    weak var controlNode: Control?
    var callback: Callback?
    
    init(_ controlNode: Control,
         _ eventType: ASControlNodeEvent,
         callback: @escaping Callback) {
        self.controlNode = controlNode
        self.callback = callback
        super.init()
        controlNode.addTarget(self,
                              action: selector,
                              forControlEvents: eventType)
        
        let method = self.method(for: selector)
        if method == nil {
            fatalError("Can't find method")
        }
    }
    
    @objc func eventHandler(_ sender: UIGestureRecognizer) {
        if let callback = self.callback, let controlNode = self.controlNode {
            callback(controlNode)
        }
    }
    
    override func dispose() {
        super.dispose()
        self.controlNode?.removeTarget(self,
                                       action: selector,
                                       forControlEvents: .allEvents)
        self.callback = nil
    }
}


extension Reactive where Base: ASControlNode {
    
    // Reactive wrapper for ASControlNode events.
    public func event(_ type: ASControlNodeEvent) -> ControlEvent<Base> {
        let source: Observable<Base> = Observable.create { [weak control = self.base] observer in
            MainScheduler.ensureExecutingOnScheduler()
            
            guard let control = control else {
                observer.on(.completed)
                return Disposables.create()
            }
            
            let observer = ASControlTarget(control, type) { control in
                observer.on(.next(control))
            }
            
            return observer
            }.takeUntil(deallocated)
        
        return ControlEvent(events: source)
    }
    
}
