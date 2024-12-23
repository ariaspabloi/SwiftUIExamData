import Foundation
import Alamofire

class APIDataViewModel: ObservableObject {
    @Published var heroes: [Hero]?
    @Published var loading = true
    
    func fetchHeroes() async {
        let url = "https://heroes-api-two.vercel.app/es/marvel/heroes"
        let request = AF.request(url)
        
        request.responseDecodable(of: [Hero].self) { [self] response in
            switch response.result {
            case .success(let fetchedHeroes):
                heroes = fetchedHeroes
                loading = false
            case .failure(let error):
                print(error)
            }
        }
    }
}
