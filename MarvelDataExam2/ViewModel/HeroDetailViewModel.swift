import Foundation
import Alamofire

class HeroDetailViewModel: ObservableObject {
    @Published var detailedHero: HeroDetail?
    
    func fetchHeroDetail(id: Int) async {
        let url = "https://heroes-api-two.vercel.app/es/marvel/heroes/\(id)"
        let request = AF.request(url)
        
        request.responseDecodable(of: HeroDetail.self) { [self] response in
            switch response.result {
            case .success(let heroDetail):
                detailedHero = heroDetail
            case .failure(let error):
                print(error)
            }
        }
    }
}
