import SwiftUI

public extension Alertify {
    private func createAlert(
        title: String?, message: String?, style: UIAlertController.Style,
        actions: [UIAlertAction]
    ) -> UIAlertController
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)

        if actions.isEmpty {
            let ok = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
                self?.removeProcessView()
            }
            alert.addAction(ok)
        } else {
            actions.forEach(alert.addAction(_:))
        }

        return alert
    }

    /// Display alert on the screen.
    /// - Parameters:
    ///   - title: The title of the alert. Use this string to get the user’s attention and communicate the reason for the alert.
    ///   - message: Descriptive text that provides additional details about the reason for the alert.
    ///   - style: The style to use when presenting the alert controller. Use this parameter to configure the alert controller as an action sheet or as a modal alert. (default style is .alert)
    ///   - actions: for the buttons in popup.
    ///   - animated: Pass true to animate the presentation; otherwise, pass false.
    ///   - completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    func alert(
        title: String? = nil, message: String? = nil, style: UIAlertController.Style = .alert,
        actions: [UIAlertAction] = [],
        animated: Bool = true, onDismiss: (() -> Void)? = nil
    ) {
        let alert = createAlert(title: title, message: message, style: style, actions: actions)
        display(alert: alert, animated: animated, onDismiss: onDismiss)
    }

    /// Display alert on the screen.
    /// - Parameters:
    ///   - title: The title of the alert. Use this string to get the user’s attention and communicate the reason for the alert.
    ///   - error: Descriptive text that provides additional details about the reason for the alert.
    ///   - style: The style to use when presenting the alert controller. Use this parameter to configure the alert controller as an action sheet or as a modal alert. (default style is .alert)
    ///   - actions: for the buttons in popup.
    ///   - animated: Pass true to animate the presentation; otherwise, pass false.
    ///   - completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    func alert(
        title: String? = nil, error: Error, style: UIAlertController.Style = .alert,
        actions: [UIAlertAction] = [],
        animated: Bool = true, onDismiss: (() -> Void)? = nil
    ) {
        let alert = createAlert(title: title, message: error.localizedDescription, style: style, actions: actions)
        display(alert: alert, animated: animated, onDismiss: onDismiss)
    }

    /// Display alert on the screen.
    /// - Parameters:
    ///   - alert: An object that can displays an alert message to the user.
    ///   - animated: Pass true to animate the presentation; otherwise, pass false.
    ///   - completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    func display(alert: UIAlertController, animated: Bool = true, onDismiss: (() -> Void)? = nil) {
        if alert.actions.isEmpty {
            let ok = UIAlertAction(title: "OK", style: .default)
            alert.addAction(ok)
        }
        rootVC?.present(alert, animated: animated, completion: onDismiss)
    }
}
