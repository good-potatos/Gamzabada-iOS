import Combine

class LoginViewModel: ObservableObject {
    var cancellable = Set<AnyCancellable>()

    let usecase = LoginUsecase()

    @Published var userInfo: String = ""

    func snsLogin() {
        self.usecase.fetchLoginSNS()
            .sink { completion in
                switch completion {
                case let .failure(err):
                    print(err)
                case .finished:
                    break
                }
            } receiveValue: { userInfo in
                print(userInfo)
            }
            .store(in: &self.cancellable)
    }
}
