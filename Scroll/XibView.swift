//
//  XibView.swift
//  Scroll
//
//  Created by 林健司 on 2021/08/14.
//

import UIKit

class XibView: UIView {

    class var xibName: String {
        String(describing: self)
    }

    class var bundle: Bundle {
        Bundle(for: self)
    }

    @IBOutlet private var loadedView: UIView! {
        didSet {
            loadedView.frame = bounds
            addSubview(loadedView)
            loadedView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        self.configureView()
    }

    private func configureView() {
        let nib = configureXib()
        nib.instantiate(withOwner: self, options: nil)
    }

    private func configureXib() -> UINib {
        UINib(nibName: Self.xibName, bundle: Self.bundle)
    }
}

