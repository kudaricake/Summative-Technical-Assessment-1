import UIKit

/// The first screen in ClubConnect. It collects the three values that the
/// confirmation screen needs and owns the manual navigation segue.
final class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var reminderSwitch: UISwitch!
    @IBOutlet weak var roleSegmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // The title is set in code to demonstrate an IBOutlet-backed label.
        titleLabel.text = "Campus Club Connect"
        navigationItem.title = "Club Connect"
        nameTextField.delegate = self
        nameTextField.returnKeyType = .done
    }

    @IBAction func joinClubButtonTapped(_ sender: UIButton) {
        // Dismiss the keyboard before the next controller is presented.
        view.endEditing(true)
        performSegue(withIdentifier: "ShowConfirmationSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowConfirmationSegue",
              let destination = segue.destination as? ConfirmationViewController else {
            return
        }

        // A text field can contain nil, so use a trimmed, safe fallback.
        let enteredName = nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if let enteredName, !enteredName.isEmpty {
            destination.studentName = enteredName
        } else {
            destination.studentName = "Club Member"
        }
        destination.wantsReminders = reminderSwitch.isOn

        // Keep the mapping defensive in case the storyboard is changed later.
        let selectedIndex = roleSegmentedControl.selectedSegmentIndex
        destination.role = roleSegmentedControl.titleForSegment(at: selectedIndex) ?? "Member"
    }
}

extension WelcomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
