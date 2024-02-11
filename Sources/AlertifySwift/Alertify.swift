import SwiftUI

extension EnvironmentValues {
    /// Returns the shared Alertify object.
    public var alertify: Alertify {
        get { Alertify.shared }
    }
}

/// An object to display popups on the screens
public final class Alertify: Doc {
    /// Returns the shared Alertify object.
    public static let shared = Alertify()
    
#if os(iOS) || os(tvOS)
    
    var rootVC: UIViewController? {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        var rootVC = windowScene?.windows.first?.rootViewController
        while let vc = rootVC?.presentedViewController {
            rootVC = vc
        }
        return rootVC
    }

    let processView = UIView()
    let activityView = UIActivityIndicatorView()

    private init(){
        processView.backgroundColor = .white
        processView.layer.cornerRadius = 10
        processView.layer.shadowRadius = 10
        processView.translatesAutoresizingMaskIntoConstraints = false
        activityView.translatesAutoresizingMaskIntoConstraints = false

        processView.addSubview(activityView)
        processView.addConstraints([
            processView.heightAnchor.constraint(equalToConstant: 100),
            processView.widthAnchor.constraint(equalToConstant: 100),

            activityView.centerXAnchor.constraint(equalTo: processView.centerXAnchor),
            activityView.centerYAnchor.constraint(equalTo: processView.centerYAnchor)
        ])
    }
    
#elseif os(watchOS)
    //MARK: might need to update
    var rootInterfaceController: WKInterfaceController? {
        WKExtension.shared().rootInterfaceController
    }
#endif
}
