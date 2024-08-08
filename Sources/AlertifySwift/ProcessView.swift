import UIKit

public extension Alertify {
    /// Present process view on the screen.
    @MainActor
    func showProcessView() {
        guard let view = rootVC?.view else {return}
        view.isUserInteractionEnabled = false
        view.addSubview(processView)
        activityView.startAnimating()

        view.addConstraints([
            processView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            processView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    /// Remove process view from the screen.
    @MainActor
    func removeProcessView() {
        if let view = rootVC?.view {
            view.isUserInteractionEnabled = true
        }
        activityView.stopAnimating()
        processView.removeFromSuperview()
    }
}
