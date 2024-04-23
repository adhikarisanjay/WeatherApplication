

import UIKit
import Foundation


public class LocationCell : UITableViewCell {
    weak var delegate: LocationCellDelegate?

    // Location data associated with the cell
    public var locationData: LocationInfo? {
          didSet {
              // Update UI elements when locationData is set
              locationImage.image =  UIImage(named: locationData?.imageName ?? "NotFound")
              locationName.text = locationData?.cityName
              locationDescriptionLabel.text = "Latitude: \(locationData?.latitude ?? 0), Longitude: \(locationData?.longitude ?? 0)"
          }
      }
    
    // Label for the city name
    private let locationName : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 12)
        lbl.textAlignment = .left
        return lbl
    }()
    
    // Label for latitude and longitude
    private let locationDescriptionLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .left
        lbl.numberOfLines = 2
        return lbl
    }()
    
   
    // Image view for the city image
    public let locationImage : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "Toronto"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    // Map button
    private let mapButton : UIButton = {
        let btn = UIButton(type: .custom)
         btn.setTitle("Map", for: .normal)
        btn.setTitleColor(UIColor.systemOrange, for: .normal)

        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)

          return btn
      }()
    
    // Weather Button
    private let weatherButton : UIButton = {
       let btn = UIButton(type: .custom)
        btn.setTitle("Weather", for: .normal)
        btn.setTitleColor(UIColor.systemOrange, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            return btn
        }()
    
    // Button action when Map button is tapped
    @objc func mapFunction() {
        let coordinate = Coordinate(latitude: locationData?.latitude, longitude: locationData?.longitude, locationName: locationData?.cityName ?? "")
        delegate?.navigateToMap(with: coordinate)
      }
    
    // Button action when Weather button is tapped
      @objc func weatherFunction() {
           let coordinate = Coordinate(latitude: locationData?.latitude, longitude: locationData?.longitude, locationName: locationData?.cityName ?? "")
            delegate?.navigateToMap(with: coordinate)
      }
      
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "myTableView")
        //configuring UI elements
        contentView.addSubview(locationImage)
        contentView.addSubview(locationName)
        contentView.addSubview(locationDescriptionLabel)
        locationImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 0, enableInsets: false)
        locationName.anchor(top: topAnchor, left: locationImage.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        locationDescriptionLabel.anchor(top: locationName.bottomAnchor, left: locationImage.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        // Create a stack view for buttons
        let stackView = UIStackView(arrangedSubviews: [mapButton,weatherButton])
               stackView.distribution = .equalSpacing
               stackView.axis = .horizontal
               stackView.spacing = 5
        contentView.addSubview(stackView)
        stackView.anchor(top: topAnchor, left: locationName.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 15, paddingLeft: 5, paddingBottom: 15, paddingRight: 10, width: 0, height: 70, enableInsets: false)
        // Set up button targets
        mapButton.addTarget(self, action: #selector(mapFunction), for: .touchUpInside)
        weatherButton.addTarget(self, action: #selector(weatherFunction), for: .touchUpInside)
       
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
