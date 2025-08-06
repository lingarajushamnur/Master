public class SearchBooks {
    public GoogleBooksResponse result { get; set; }     
    public class GoogleBooksResponse{
        public  String kind{get;set;}
        public String id {get;set;} 
        public String etag {get;set;} 
        public  Integer totalItems{get;set;}
        public  List<items> items{get;set;}
    }
    public class Items {
        public String kind {get;set;} 
        public String id {get;set;} 
        public String etag {get;set;} 
        public String selfLink {get;set;} 
        
    }
    
    public HttpResponse callsearch() {
        String s;
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setHeader('Content-Type','application/json');
        req.setHeader('Accept','application/json');
        req.setEndpoint('https://www.googleapis.com/books/v1/volumes?q=harry+potter');
        Http http = new Http();
        HTTPResponse res = null;
        res = http.send(req);
        s = res.getBody();
        // Not a local variable
        result = (GoogleBooksResponse)  System.JSON.deserialize(s , GoogleBooksResponse.class);
        this.result = result;
        return null;
    }
}