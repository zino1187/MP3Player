//
//  PlayController.swift
//  MP3Player
//
//  Created by zino-mac on 2020/03/04.
//  Copyright © 2020 zino-mac. All rights reserved.
//

import UIKit
import AVFoundation

class PlayController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var music_title: UILabel!
    
    //ios에서 음원을 재생하기 위한 객체
    var player:AVAudioPlayer!
    
    
    @IBAction func btnClick(_ sender: Any) {
        play()
    }
    
    func play(){
        //음원 재생하기
        //현재 스마트폰내 중 현재앱에 할당된 접근경로
        //즉 로컬 파일에 있는 데이터 접근하기!!
        let url = Bundle.main.url(forResource: music_title.text, withExtension: "mp3")
        do{
        player = try AVAudioPlayer(contentsOf:url!)
        }catch{
            print("객체 초기화 실패,자원확인 필요")
        }
        
        //오디오 객체와 델리게이트 연결!!
        player.delegate = self
        
        //재생하기
        player.play()
    }
    
    @IBAction func pause(_ sender: Any) {
        player.pause()
    }
    
    @IBAction func stop(_ sender: Any) {
        player.stop()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //화면에 뷰가 로드 될때마다 , 이전 클래스의
        //멤버변수를 통해 선택한 배열의 값 출력!!
        let previous = self.navigationController?.viewControllers[0] as! MusicListController
            
    print(previous.data[previous.selectedRow])
            
        //라벨에 출력하기
        music_title.text = previous.data[previous.selectedRow]
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
