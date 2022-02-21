import Foundation
import UIKit
import SnapKit
import CoreMedia

class CustomDailyCell: UITableViewCell {
    
    static let identifier = "CustomDailyCell"
    
    let dailyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = .black
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    
    override func layoutSubviews() {
        dailyCollectionView.delegate = self
        dailyCollectionView.dataSource = self
        
        addSubview(dailyCollectionView)
        dailyCollectionView.snp.makeConstraints { make in
            make.height.width.equalToSuperview()
        }
        setupCollectionView()
        
    }
    
    
    
    private var models: [HourlyModelElement]? = nil
    
    func fill(models: [HourlyModelElement]?) {
        self.models = models
        dailyCollectionView.reloadData()
    }
    
    private func setupCollectionView(){
        dailyCollectionView.register(DailyCell.self, forCellWithReuseIdentifier: "DailyCell")
    }
}

extension CustomDailyCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DailyCell", for: indexPath) as! DailyCell
        if let model = models?[indexPath.row] {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH"
            let hourString = formatter.string(from: Date())
            cell.fillCell(model: model, hour: "\(hourString)")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.height - 1, height: frame.height - 1)
    }
}
