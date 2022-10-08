import Alamofire
import Moya


public enum Lion {
    //  获取轮播图
    case imgurl
}

extension Lion: TargetType{
    
    public var baseURL: URL{
        switch self {
        case .imgurl:
            return URL(string: "https://lion.hzau.edu.cn")!
        }
    }
    
    public var path: String{
        switch self {
        case .imgurl:
            return "/app/navImgs"
        }
    }
    
    public var method: Moya.Method{
        return .post
    }
    
    public var headers: [String : String]? {
        return ["Content-Type":"application/json"]
    }
    
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    public var task: Task{
        switch self {
        case .imgurl:
            var params: [String: Any] = [:]
            params["platform"] = "voluptate"
            params["schoolId"] = "aliquip fugiat pariatur"
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
            
        default:
            return .requestPlain
        }
    }
}

