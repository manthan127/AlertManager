import UIKit

public extension Alertify {
    /// Present process view on the screen.
    func showProcessView() {
        DispatchQueue.main.async { [self] in
            guard let view = rootVC?.view else {return}
            view.isUserInteractionEnabled = false
            view.addSubview(processView)
            activityView.startAnimating()
            
            view.addConstraints([
                processView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                processView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ])
        }
    }

    /// Remove process view from the screen.
    func removeProcessView() {
        DispatchQueue.main.async { [self] in
            if let view = rootVC?.view {
                view.isUserInteractionEnabled = true
            }
            activityView.stopAnimating()
            processView.removeFromSuperview()
        }
    }
}
