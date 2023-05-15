import UIKit

class StoryViewController: UIViewController {
    @IBOutlet weak var storyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyTableView.delegate = self
        storyTableView.dataSource = self
    }
}

extension StoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = storyTableView.dequeueReusableCell(withIdentifier: "storyCell", for: indexPath)
        
        return cell
    }
}
