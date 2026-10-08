import UIKit

/// Shows the values passed from WelcomeViewController after registration.
final class ConfirmationViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!

    // Defaults keep the destination safe even if it is opened without a segue.
    var studentName = "Club Member"
    var wantsReminders = false
    var role = "Member"

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "You're In"

        let reminderText = wantsReminders ? "You will receive meeting reminders." : "Meeting reminders are off."
        messageLabel.text = "Welcome, \(studentName)!\n\nYou joined as a \(role).\n\n\(reminderText)"
    }
}
