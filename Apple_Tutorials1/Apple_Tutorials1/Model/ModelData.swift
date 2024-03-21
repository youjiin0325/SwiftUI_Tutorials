//
//  ModelData.swift
//  Apple_Tutorials1
//
//  Created by 유지인 on 3/1/24.
//



import Foundation

@Observable
class ModelData{
    var landmarks: [LandMark] = load("landmarkData.json")
    var hikes:[Hike] = load("hikeData.json")
    var profile = Profile.default //사용자가 프로필 보기를 닫은 후에도 지속되는 사용자 프로필의 인스턴스를 포함하도록 클래스를 업데이트합니다 .ModelData
    
    //설정된 랜드마크만 포함하는 계산된 새로운 배열반환
    var features:[LandMark] {
        landmarks.filter{ $0.isFeatured }
    }
    
    
    //이름을 키로 사용하고 각 키에 연결된 랜드마크 배열을 사용하여 계산된 사전을 추가
    var categories:[String:[LandMark]] {
        Dictionary(
         grouping: landmarks,
         by: {$0.category.rawValue}
        )
    }
}




//Create an array of landmarks that you initialize from landmarkData.json.
var landMarks: [LandMark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
