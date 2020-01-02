//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 小野寺祥吾 on 2020/01/01.
//  Copyright © 2020 syogo-user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageAnimal: UIImageView!
    @IBOutlet weak var playStopButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    var timer :Timer!
    let animalImage:[String] = ["animalface_tanuki","animalface_tora","animalface_usagi"]
    var index = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //たぬきを初期表示
        imageAnimal.image = UIImage(named: animalImage[index])
    }
    //画像を自動表示
    @objc func updateImage(_ timer:Timer){
        //indexを一つ進める
        nextIndex()
        imageAnimal.image = UIImage(named: animalImage[index])
    }
    //画像がタップされたとき
    @IBAction func onTapImage(_ sender: Any) {
        //自動再生中の場合
        if self.timer != nil {
            //自動再生を停止する
            //文字列を再生にする
            playStopButton.setTitle("再生", for: UIControl.State.normal)
            //進むボタンと戻るボタンを活性にする
            forwardButton.isEnabled = true
            backButton.isEnabled = true

            //タイマーを停止
            self.timer.invalidate()
            self.timer = nil
        }
        
        //セグエを使用して画面遷移
        performSegue(withIdentifier: "ImageResult", sender: nil)
        
    }
    override func prepare (for segue:UIStoryboardSegue,sender :Any?) {
        let resultViewController:ExpansionImageViewController = segue.destination as! ExpansionImageViewController
        resultViewController.selectedImage = UIImage(named:animalImage[index])
    }
    
    
    //indexを一つ進める
    func nextIndex(){
        if index == 2 {
            index = 0
        }else{
            index += 1
        }
    }
    //indexを一つ戻す
    func beforeIndex(){
        if index == 0{
            index = 2
        }else{
            index -= 1
        }
    }
    
    //再生・停止
    @IBAction func playOrStop(_ sender: Any) {
        //動作中のタイマーを一つに保つためtimerが存在しない時だけタイマーを生成して動作させる
        if self.timer == nil {
            //文字列を停止にする
            playStopButton.setTitle("停止", for: UIControl.State.normal)
            //進むボタンと戻るボタンを非活性にする
            forwardButton.isEnabled = false
            backButton.isEnabled = false
            //再生ボタンを押すとタイマーの作成、始動
            self.timer = Timer.scheduledTimer(timeInterval: 2, target:
                self, selector:#selector(updateImage(_:)),userInfo:nil,repeats: true)
        }else{
            //文字列を再生にする
            playStopButton.setTitle("再生", for: UIControl.State.normal)
            //進むボタンと戻るボタンを活性にする
            forwardButton.isEnabled = true
            backButton.isEnabled = true

            //タイマーを停止
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    //進む
    @IBAction func forward(_ sender: Any) {
        //自動再生していない時
        if self.timer == nil {
            nextIndex()
            imageAnimal.image = UIImage(named: animalImage[index])
        }
    }
    
    //戻る
    @IBAction func back(_ sender: Any) {
        //自動再生していない時
        if self.timer == nil {
            beforeIndex()
            imageAnimal.image = UIImage(named: animalImage[index])
        }
    }
    
    @IBAction func unwind(_ segue:UIStoryboardSegue){
        //他の画面から戻った時の処理
        
    }
}

