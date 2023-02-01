//
//  NextView.swift
//  21cm0127&31 Test
//
//  Created by cmStudent on 2023/01/11.
//
//決定ボタンを押したらkaitouViewに保存できるようにボタンのプログラムの変更がしたい
import SwiftUI

struct NextView: View {
    @State var theText: String = ""
    var body: some View {
        NavigationView {
            
            // 奥から手前方向にレイアウト
            ZStack {
                
                VStack(spacing: 30.0) {
                    
                    // テキストを表示する
                    Text("夢の地図1日目")
                        // 文字サイズを指定
                        .font(.largeTitle)
                    
                    Text("あなたのスマホにあるあぷりで一番好きなものはなんですか？なぜそれがすきなのか一言で答えてみてください")
                    TextEditor(text: $theText)
                        .lineSpacing(10)
                        .border(Color.gray)
                        .padding([.leading,.bottom,.trailing])
                    
                    
                        
                    HStack {
                       
                        Button(action: {
                        
                        }) {
                            // テキストを表示する
                            Text("決定")
                                // 文字サイズを指定
                                .font(.title)
                                // 文字色を黒に指定
                                .foregroundColor(Color.black)
                                // 幅高さを140に指定
                                .frame(width: 100, height: 100)
                                // 背景を設定
                                .background(Color.blue)
                                // 円形に切り抜く
                                .clipShape(Circle())
                                
                            
                            
                        }  // ストップボタン ここまで
                    } // HStack ここまで
                } // VStack ここまで
            } // ZStack ここまで
            
            
        }
        .navigationBarItems(trailing:
                                NavigationLink(destination:kaitouView()){
                                    Text("回答へ")
                                })
            // ナビゲーションバーにボタンを追加
           
    } // body ここまで
    func saveText(_ textData:String, _ fileName:String){
        //docURLはユーザー定義変数
        guard let url = docURL(fileName) else {
            return
        }
        //ファイルパスへの保存
        do {
            let path = url.path
            try textData.write(toFile: path, atomically: true, encoding:  .utf8)
        } catch let error as NSError {
            print(error)
        }
    }

    func docURL(_ fileName:String) -> URL? {
        let fileManager = FileManager.default
        do {
            //Documentsフォルダ
            let docsUrl = try fileManager.url(
                //Documentフォルダを指定する。
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: false)
            let url = docsUrl.appendingPathComponent(fileName)
            return url
        }catch {
            return nil
        }
    }

    //テキストデータを読み込んで返す。
    func loadText(_ fileName:String) -> String? {
        //URLを得られたらアンラップしてurlに代入
        guard let url = docURL(fileName) else {
            return nil
        }
        //urlからの読み込み
        do {
            let textData = try String(contentsOf: url, encoding: .utf8)
            return textData
        } catch {
            return nil
        }
    }
    } // startTimer() ここまで


struct NextView_Previews: PreviewProvider {
    static var previews: some View {
        NextView()
    }
}
