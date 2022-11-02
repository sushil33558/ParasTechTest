//
//  TestScreenViewController.swift
//  PtTest
//
//  Created by Sushil chaudhary on 10/11/22.
//
//-----------------------------------------------------------------------
import UIKit
import SDWebImage
class TestScreenViewController: UIViewController {
//MARK: - IBoutlet
//---------------
    @IBOutlet weak var blistCV: UICollectionView!
    @IBOutlet weak var topExpCV: UICollectionView!
    @IBOutlet weak var newlyCreatedCv: UICollectionView!
    
//MARK: - variables
//---------------
    var viewModel = TestScreenViewModel()
    var blistItem = [Item]()
    var topExp = [Item]()
    var newlyCreated = [Item]()
//MARK: - ViewlifeCycles
//---------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "List"
        cellRegistration()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DelData()
        ApiCall()
    }
//MARK: - iBaction
//---------------
//MARK: - func
//---------------
    func cellRegistration(){
        blistCV.register(UINib(nibName: "FirstCell", bundle: nil), forCellWithReuseIdentifier: "FirstCell")
        topExpCV.register(UINib(nibName: "SecondCell", bundle: nil), forCellWithReuseIdentifier: "SecondCell")
        newlyCreatedCv.register(UINib(nibName: "ThirdCell", bundle: nil), forCellWithReuseIdentifier: "ThirdCell")
    }
    func DelData(){
        blistCV.delegate = self
        blistCV.dataSource = self
        topExpCV.delegate = self
        topExpCV.dataSource = self
        newlyCreatedCv.delegate = self
        newlyCreatedCv.dataSource = self
        blistCV.showsHorizontalScrollIndicator = false
        topExpCV.showsHorizontalScrollIndicator = false
        newlyCreatedCv.showsHorizontalScrollIndicator = false
    }
    func ApiCall(){
        viewModel.TestDataApi { (isSuccess,message) in
            if isSuccess{
                print("-----------------Api is hit-----------------")
                self.blistItem = (self.viewModel.model?.data[0].items)!
                self.topExp = (self.viewModel.model?.data[1].items)!
                self.newlyCreated = (self.viewModel.model?.data[2].items)!
                self.blistCV.reloadData()
                self.topExpCV.reloadData()
                self.newlyCreatedCv.reloadData()
            }else{
                print("-----------------Api not hit-----------------")
                self.present(UIAlertController(title: "Attention", message:message , preferredStyle: .alert), animated: true, completion: nil)
            }
        }
    }
//MARK: - objc func
//---------------
}

//MARK: - extension
//----------------
extension TestScreenViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    //DetaSource
    //----------
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == blistCV{
            let cell = blistCV.dequeueReusableCell(withReuseIdentifier: "FirstCell", for: indexPath) as! FirstCell
            cell.blistImageView.layer.cornerRadius = 10
            cell.expView.layer.cornerRadius = (cell.expView.frame.height)/2
            cell.amtView.layer.cornerRadius = (cell.amtView.frame.height)/2
            cell.blistImageView.sd_setImage(with: URL(string: "\(blistItem[indexPath.row].image )"))
            cell.amtLbl.text = "$:\(blistItem[indexPath.row].amount)"
            cell.expIdLbl.text = "\(blistItem[indexPath.row].expID)"
            cell.experienceLbl.text = "\(blistItem[indexPath.row].experienceName)"
            cell.categoryNameLbl.text = "\(blistItem[indexPath.row].categoryName)"
            return cell
        }else if collectionView == topExpCV{
            let cell = topExpCV.dequeueReusableCell(withReuseIdentifier: "SecondCell", for: indexPath) as! SecondCell
            cell.secondImageView.layer.cornerRadius = 10
            cell.categoryNameView.layer.cornerRadius = (cell.categoryNameView.frame.height)/2
            cell.userNameView.layer.cornerRadius = (cell.userNameView.frame.height)/2
            cell.secondImageView.sd_setImage(with: URL(string: "\(topExp[indexPath.row].image)"))
            cell.userNameLbl.text = "\(topExp[indexPath.row].username)"
            cell.categoryNameLbl.text = "\(topExp[indexPath.row].categoryName)"
            return cell
        }else{
            let cell = newlyCreatedCv.dequeueReusableCell(withReuseIdentifier: "ThirdCell", for: indexPath) as! ThirdCell
            cell.thirdInnerView.layer.cornerRadius = 10
            cell.thirdImageView.roundCorners([.topLeft,.topRight], radius: 12)
            cell.thirdImageView.clipsToBounds = true
            cell.thirdImageView.sd_setImage(with: URL(string: "\(newlyCreated[indexPath.row].image)"))
            cell.amtUserLbl.text = "$:\(newlyCreated[indexPath.row].amount)+\(" ")\(newlyCreated[indexPath.row].username)"
            cell.expNameLbl.text = "\(newlyCreated[indexPath.row].experienceName)"
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == blistCV{
            return blistItem.count
        }else if collectionView == topExpCV{
            return topExp.count
        }else{
            return newlyCreated.count
        }
    }
    
    //DelegateflowLAyout
    //-----------------
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == blistCV{
            let width = (blistCV.frame.width-80)
            let height = (blistCV.frame.height-10)
            return(CGSize(width: width, height: height))
        }else if collectionView == topExpCV{
            let width = (topExpCV.frame.width)/2.2
            let height = (topExpCV.frame.height-10)
            return(CGSize(width: width, height: height))
        }else{
            let width = (newlyCreatedCv.frame.width)/2.2
            let height = (newlyCreatedCv.frame.height+20)
            return(CGSize(width: width, height: height))
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == blistCV{
            return 10
        }else if collectionView == topExpCV{
            return 10
        }else{
            return 10
        }
    }
}
//MARK: - customFunctionfor UIimageView(roundCorner)
//-------------------------
extension UIImageView {
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
}
