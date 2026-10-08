import UIKit

final class WelcomeViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var reminderSwitch: UISwitch!
    @IBOutlet private weak var roleSegmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Campus Club Connect"
        title = "ClubConnect"
        nameTextField.delegate = self
        roleSegmentedControl.selectedSegmentIndex = 0
        reminderSwitch.isOn = true
    }

    @IBAction private func joinClubTapped(_ sender: UIButton) {
        nameTextField.resignFirstResponder()
        performSegue(withIdentifier: "ShowConfirmationSegue", sender: sender)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowConfirmationSegue",
              let confirmationViewController = segue.destination as? ConfirmationViewController
        else { return }

        let trimmedName = nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        confirmationViewController.studentName = trimmedName.isEmpty ? "Club Member" : trimmedName
        confirmationViewController.wantsReminders = reminderSwitch.isOn
        let index = roleSegmentedControl.selectedSegmentIndex
        confirmationViewController.role = index == 1 ? "Officer" : "Member"
    }
}

extension WelcomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
