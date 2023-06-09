import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let limit: Int = 129
    var array = Array<Int>(70...90)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.prefetchDataSource = self
    }
    
    func update() {
        guard let last = array.last else { return }
<<<<<<< HEAD
        let start = last + 1
        let end = last + 10
        let appendedArray = array + Array<Int>(start...end)
=======
>>>>>>> main
        
        if last < limit {
            let start = last + 1
            var end = last + 10
            
            if end > limit {
                end = limit
            }
            
            array += Array<Int>(start...end)
            tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = String(array[indexPath.row])
        
        return cell
    }
}

extension ViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        update()
    }
}


