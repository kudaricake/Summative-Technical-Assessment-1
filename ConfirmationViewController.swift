import UIKit

final class ConfirmationViewController: UIViewController {
    @IBOutlet private weak var messageLabel: UILabel!

    var studentName = "Club Member"
    var wantsReminders = true
    var role = "Member"

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Confirmation"
        let reminderText = wantsReminders ? "Meeting reminders are on." : "Meeting reminders are off."
        messageLabel.text = "Thanks, \(studentName)!\n\nYou joined as a \(role).\n\(reminderText)\n\nWe’ll keep you connected with Campus Club Connect."
    }
}
