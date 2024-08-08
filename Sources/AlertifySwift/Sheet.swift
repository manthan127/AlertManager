import SwiftUI

public extension Alertify {
    /// Present sheet on the screen.
    /// - Parameters:
    ///   - view: A SwiftUI View to display on sheet.
    ///   - dismissOnSwipe: Pass true to dismiss the presentation on swipe-down; otherwise, pass false.
    ///   - animated: Pass true to animate the presentation; otherwise, pass false.
    ///   - onDismiss: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    @MainActor
    func present<content: View>(
        view: content, dismissOnSwipe: Bool = true,
        animated: Bool = true, onDismiss: (() -> Void)? = nil
    ) {
        let vc = UIHostingController(rootView: view)
        vc.isModalInPresentation = !dismissOnSwipe

        rootVC?.present(vc, animated: animated, completion: onDismiss)
    }

    /// Present sheet on the screen.
    /// - Parameters:
    ///   - dismissOnSwipe: Pass true to dismiss the presentation on swipe-down; otherwise, pass false.
    ///   - animated: Pass true to animate the presentation; otherwise, pass false.
    ///   - onDismiss: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    ///   - view: A SwiftUI View to display view on sheet
    @MainActor
    func present<content: View>(
        dismissOnSwipe: Bool = true,
        animated: Bool = true, onDismiss: (() -> Void)? = nil,
        @ViewBuilder view: @escaping () -> content
    ) {
        let vc = UIHostingController(rootView: view())
        vc.isModalInPresentation = !dismissOnSwipe

        rootVC?.present(vc, animated: animated, completion: onDismiss)
    }

    /// Present sheet on the screen.
    /// - Parameters:
    ///   - viewController: An UIViewController to display on sheet
    ///   - dismissOnSwipe: Pass true to dismiss the presentation on swipe-down; otherwise, pass false.
    ///   - animated: Pass true to animate the presentation; otherwise, pass false.
    ///   - onDismiss: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    @MainActor
    func present(
        viewController: UIViewController, dismissOnSwipe: Bool = true,
        animated: Bool = true, onDismiss: (() -> Void)? = nil
    ) {
        viewController.isModalInPresentation = !dismissOnSwipe
        rootVC?.present(viewController, animated: animated, completion: onDismiss)
    }

    /// dismiss sheet or alert on the screen.
    ///
    /// - Parameters:
    ///   - animated: Pass true to animate the presentation; otherwise, pass false.
    ///   - completion: The block to execute after the view or view controller is dismissed. This block has no return value and takes no parameters. You may specify nil for this parameter.
    @MainActor
    func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        self.rootVC?.dismiss(animated: animated, completion: completion)
    }
}
