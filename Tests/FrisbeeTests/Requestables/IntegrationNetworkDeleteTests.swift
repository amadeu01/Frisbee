import XCTest
import Frisbee

final class IntegrationNetworkDeleteTests: XCTestCase {

    struct Json: Codable {
        let id: Int? // swiftlint:disable:this identifier_name
        let content: String?
        let url: String?
    }

    struct ReqresId: Codable {
        let id: String // swiftlint:disable:this identifier_name
    }

    func testDeleteWhenHasValidURLThenRequestAndTransformData() {
        let url = URL(string: "https://reqres.in/api/users/1")!
        let longRunningExpectation = expectation(description: "DeleteWithSuccess")
        var returnedData: ReqresId?

        NetworkDelete().delete(url: url) { (result: Result<ReqresId>) in
            returnedData = result.data
            longRunningExpectation.fulfill()
        }

        waitForExpectations(timeout: 20) { expectationError in
            XCTAssertNil(expectationError, expectationError!.localizedDescription)
            XCTAssertNil(returnedData)
        }
    }

    func testDeleteWhenHasValidURLAndWithBodyThenRequestAndTransformData() {
        let url = URL(string: "https://reqres.in/api/users/1")!
        let longRunningExpectation = expectation(description: "DeleteWithSuccess")
        var returnedData: Json?
        let body = Json(id: 345, content: #function, url: url.absoluteString)

        NetworkDelete().delete(url: url, body: body) { (result: Result<Json>) in
            returnedData = result.data
            longRunningExpectation.fulfill()
        }

        waitForExpectations(timeout: 20) { expectationError in
            XCTAssertNil(expectationError, expectationError!.localizedDescription)
            XCTAssertNil(returnedData)
        }
    }

    static var allTests = [
        ("testPostWhenHasValidURLThenRequestAndTransformData",
         testDeleteWhenHasValidURLThenRequestAndTransformData),
        ("testPostWhenHasValidURLAndWithBodyThenRequestAndTransformData",
         testDeleteWhenHasValidURLAndWithBodyThenRequestAndTransformData)
    ]

}
