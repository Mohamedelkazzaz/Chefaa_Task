//
//  SplashViewController.swift
//  Chefaa_Task
//
//  Created by Mohamed Elkazzaz on 29/12/2023.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var logoImageVIew: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        animateLogo()
    }
    
    private func animateLogo() {
        logoImageVIew.alpha = 0.0

          UIView.animate(withDuration: 1.0, animations: {
              self.logoImageVIew.alpha = 1.0
          }) { (finished) in
              // Animation completed
              // You can navigate to the main screen or perform any other actions here
              let stoaryBoard = UIStoryboard(name: "Main", bundle: nil)
              let vc = stoaryBoard.instantiateViewController(withIdentifier: "CharactersViewController") as! CharactersViewController
              self.navigationController?.pushViewController(vc, animated: true)
          }
      }

}
