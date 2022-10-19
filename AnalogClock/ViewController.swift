//
//  ViewController.swift
//  AnalogClock
//
//  Created by trung on 15/10/2022.
//

import UIKit

class ViewController: UIViewController {

    let clockFace: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dongHo")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .red
        return imageView
    } ()
    
    let hourImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kimGio")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemPink
        return imageView
    } ()
    
    let minuteImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kimPhut")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .orange
        return imageView
    } ()
    
    let secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kimGiay")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .yellow
        return imageView
    } ()
    
    var timer: Timer! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTimer()
    }
    
    func setupUI() {
        view.addSubview(clockFace)
        clockFace.frame = .init(x: 0, y: 0, width: 300, height: 300)
        clockFace.center = view.center
        
        view.addSubview(hourImageView)
        hourImageView.frame = clockFace.frame
        
        view.addSubview(minuteImageView)
        minuteImageView.frame = clockFace.frame
        
        view.addSubview(secondImageView)
        secondImageView.frame = clockFace.frame
    }

    func setupTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
                    let currentDate = Date()
                    let calendar = Calendar.current
                    let components = calendar.dateComponents([.day, .month, .year, .hour, .minute, .second], from: currentDate)
            //Goc tinh so gio hien tai
            let angleHour = Float(components.hour!) * .pi/6
            //Goc lech kim gio phu thuoc vao so phut hien tai
            let angleHourMin = Float(components.minute!) * .pi/360
            let angleTotalHour = angleHour + angleHourMin
            //1 pi 180 = 1/2 vong
            //1gio = 360/12 hoac = pi/6
            self.hourImageView.transform = .init(rotationAngle: CGFloat(angleTotalHour))
            // 1p hoac 360/60 = 6 hoac pi/30
            self.minuteImageView.transform = .init(rotationAngle: CGFloat(Float(components.minute!) * .pi/30))
            self.secondImageView.transform = .init(rotationAngle: CGFloat(Float(components.second!) * .pi/30))
            
                })
    }
}

