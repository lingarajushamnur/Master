public class BookService {
    public static HttpResponse makeGetCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://www.googleapis.com/books/v1/volumes?q=Java');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'items' key as a list
            List<Object> items = (List<Object>) results.get('items');
            System.debug('Received the following items:');
            for (Object item: items) {
                System.debug(item);
            }
        }
        return response;
    }
}