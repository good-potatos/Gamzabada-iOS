import Combine
class LoginUsecase {
    let repo = Repository()

    func fetchLoginSNS() -> AnyPublisher<UserInfo, NetworkError> {
        let body = ["accessToken": "string",
                    "snsType": "APPLE",
                    "snsUserId": "string"]

        return self.repo.fetchSnsLogin(body: body)
            .map { $0.data.userInfo }
            .eraseToAnyPublisher()
    }
}
