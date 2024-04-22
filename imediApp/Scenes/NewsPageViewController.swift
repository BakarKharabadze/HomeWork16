//
//  NewsPageViewController.swift
//  imediApp
//
//  Created by Bakar Kharabadze on 4/19/24.
//

import UIKit

class NewsPageViewController: UIViewController {
    
    // MARK: - Properties
    private let tableView = UITableView()
    private var news = [News]()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchData()
    }
    
    // MARK: - Setup
    private func setup() {
        setupNavigationController()
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.separatorStyle = .none
        tableView.contentInset.top = 20
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(NewsCell.self, forCellReuseIdentifier: "NewsCell")
    }
    
    private func setupNavigationController() {
        title = "Panicka News"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Private Methods
    private func fetchData() {
        let url = "https://imedinews.ge/api/categorysidebarnews/get"
        getData(from: url) { [weak self] result in
            switch result {
            case .success(let news):
                self?.news = news
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getData(from url: String, completion: @escaping (Result<[News], Error>) -> Void) {
        
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            guard let data, error == nil else {
                completion(.failure(error!))
                return
            }
            
            var result: NewsResponse?
            do {
                result = try JSONDecoder().decode(NewsResponse.self, from: data)
            }
            catch {
                completion(.failure(error))
            }
            
            if let result {
                completion(.success(result.news))
            }
        })
        .resume()
    }
}

extension NewsPageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        let newsItem = news[indexPath.row]
        cell.configure(with: newsItem)
        return cell
    }
}

extension NewsPageViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        125
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ArticleViewController()
        vc.news = news[indexPath.row]
        navigationController?.pushViewController(vc, animated: false)
    }
}



