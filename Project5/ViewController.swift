import UIKit

class ViewController: UITableViewController {
	var allWords = [String]()
	var usedWords = [String]()

	override func viewDidLoad() {
		super.viewDidLoad()

		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))

		if let startWordsPath = Bundle.main.path(forResource: "start", ofType: "txt") {
			if let startWords = try? String(contentsOfFile: startWordsPath) {
				allWords = startWords.components(separatedBy: "\n")
			}
		}

		startGame()
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return usedWords.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
		cell.textLabel?.text = usedWords[indexPath.row]
		return cell
	}

	func startGame() {
		title = "Table"
		usedWords.removeAll(keepingCapacity: true)
		tableView.reloadData()
	}

	@objc func promptForAnswer() {
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer: answer)
        }
        ac.addAction(submitAction)
        present(ac, animated: true)
	}

	func submit(answer: String) {
        let lowerAnswer = answer.lowercased()
        usedWords.insert(answer, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .right)
	}
}
