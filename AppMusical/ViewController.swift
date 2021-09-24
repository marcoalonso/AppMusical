//
//  ViewController.swift
//  AppMusical
//
//  Created by marco rodriguez on 24/09/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playNota(_ sender: UIButton) {
        
        //guard let tituloSonido = sender.currentTitle else { return }
        print(sender.currentTitle ?? "A")
        //reproducirSonido(nombreSonido: sender.currentTitle!)
        //print(tituloSonido)
        
        
        
    }
    
    func reproducirSonido(nombreSonido: String ) {
        
        guard let url = Bundle.main.url(forResource: nombreSonido, withExtension: "wav") else { return }

            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)

                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)

                
                guard let player = player else { return }

                player.play()

            } catch let error {
                print(error.localizedDescription)
            }
    }

}

