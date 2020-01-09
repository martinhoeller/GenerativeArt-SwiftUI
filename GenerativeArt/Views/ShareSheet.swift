import SwiftUI

struct ShareSheet: UIViewControllerRepresentable {
    let activityItems: [Any]
    let applicationActivities: [UIActivity]?

    func makeUIViewController(context: UIViewControllerRepresentableContext<ShareSheet>) -> UIActivityViewController {
        let activityViewController = UIActivityViewController(activityItems: activityItems,
                                                              applicationActivities: applicationActivities)
        activityViewController.completionWithItemsHandler = { (activityType, completed, returnedItems, error) in
            if let error = error {
                self.showError(error)
                return
            }

            if completed {
                self.showSuccess()
            }
        }

        return activityViewController
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController,
                                context: UIViewControllerRepresentableContext<ShareSheet>) {
        // do nothing
    }

    private func showSuccess() {
        let alert = UIAlertController(title: "Image Saved", message: "The image was saved successfully.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        if let parent = UIApplication.shared.windows.first?.rootViewController {
            parent.present(alert, animated: true, completion: nil)
        }
    }

    private func showError(_ error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        if let parent = UIApplication.shared.windows.first?.rootViewController {
            parent.present(alert, animated: true, completion: nil)
        }
    }
}
