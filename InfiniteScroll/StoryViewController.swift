import UIKit

class StoryViewController: UIViewController {
    @IBOutlet weak var storyTableView: UITableView!
    
    let story: String = "The prince befriends a fox, who teaches him that the important things in life are visible only to the heart, that his time away from the rose makes the rose more special to him, and that love makes a person responsible for the beings that one loves. The little prince realizes that, even though there are many roses, his love for his rose makes her unique and that he is therefore responsible for her. Despite this revelation, he still feels very lonely because he is so far away from his rose. The prince ends his story by describing his encounters with two men, a railway switchman and a salesclerk."
    var storyArray: [String] = []
    var prefetchArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyTableView.delegate = self
        storyTableView.dataSource = self
        storyTableView.prefetchDataSource = self
        storyArray = story.components(separatedBy: " ").filter { !$0.isEmpty }
        prefetchArray.append(contentsOf: storyArray[0...20])
    }
    
    func storyUpdate() {
        let last = prefetchArray.count // 21
        
        if last < storyArray.count {
            let start = last
            var end = last + 9
            
            if end > last {
                end = last
            }
            
            prefetchArray.append(contentsOf: storyArray[start...end])
            storyTableView.reloadData()
        }
    }
}

extension StoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prefetchArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = storyTableView.dequeueReusableCell(withIdentifier: "storyCell", for: indexPath)
        
        cell.textLabel?.text = prefetchArray[indexPath.row]
        
        return cell
    }
}

extension StoryViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        storyUpdate()
    }
}
