override func viewDidLoad() {
    super.viewDidLoad()
    ImageUrl()
    print(idata[1].imgUrl)
}


func getUrl(Imagedata: [ImageData]){
    print(Imagedata[1].imgUrl)
    idata = Imagedata
    print(idata[1].imgUrl)
    //print("run getUrl")
}

func ImageUrl(){
    Alamofire.AF.request(url, method: .post, parameters: parameter, encoder: .json, headers: heads).responseJSON{ response in
        do{
            let imagejson = try JSONDecoder().decode (ImageJson.self, from: response.data!)
            print(imagejson.data[1].imgUrl)
            self.getUrl(Imagedata: imagejson.data)
        }catch{
            print(error)
        }

    }

}
