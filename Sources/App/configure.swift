import Vapor
import VaporRouting

enum SiteRoute {
  case users
}

enum Site {
  static let router = OneOf {
    Route(.case(SiteRoute.users)) {
      Method.get
      Path { "users" }
    }
  }
}

public func configure(_ app: Application) async throws {
  app.mount(Site.router, use: siteHandler)
}

func siteHandler(
  request: Request,
  route: SiteRoute
) async throws -> any AsyncResponseEncodable {
  switch route {
  case .users:
    return "[]"
  }
}
