public class GoogleBooksResponse{
    public  String kind;
    public String id;
    public String etag;
    public  Integer totalItems;
    public  List<items> items; //Your existing class.
    
    public class Items {
        public String kind {get;set;} 
        public String id {get;set;} 
        public String etag {get;set;} 
        public String selfLink {get;set;} 
        
    }
    
}