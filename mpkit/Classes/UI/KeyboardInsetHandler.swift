//
//  KeyboardInsetHandler.swift
//  mpkit
//
//  Created by Martin Prot on 29/08/2018.
//  Copyright © 2018 Appricot media. All rights reserved.
//

import UIKit

final public class KeyboardInsetHandler {
    private let scrollView: UIScrollView?
    public var defaultInsets: UIEdgeInsets?

    public init(scrollView: UIScrollView?) {
        self.scrollView = scrollView
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.onKeyboardWillShow(_:)),
                                               name: .UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.onKeyboardDidHide(_:)),
                                               name: .UIKeyboardDidHide, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc private func onKeyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
            let keyboardRectValue = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue
            else { return }
        if self.defaultInsets == nil {
            self.defaultInsets = self.scrollView?.contentInset
        }
        var insets = self.scrollView?.contentInset ?? .zero
        insets.bottom = keyboardRectValue.cgRectValue.size.height
        self.scrollView?.contentInset = insets
        self.scrollView?.scrollIndicatorInsets = insets
    }

    @objc private func onKeyboardDidHide(_ notification: Notification) {
        let insets = self.defaultInsets ?? .zero
        self.scrollView?.contentInset = insets
        self.scrollView?.scrollIndicatorInsets = insets
    }
}
