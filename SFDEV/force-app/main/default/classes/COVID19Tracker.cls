public class COVID19Tracker {
    public CovidstatusReportTotal CovidstatusReportTotalwrapper {get;set;}
    public stateWise getToatal{get;set;}
    public void getCovidData() {
        Http h = new Http();
        HttpRequest request = new HttpRequest();
        request.setHeader('Accept', 'application/json');
        request.setEndPoint('https://api.covid19india.org/data.json');
        request.setHeader('Content-type', 'application/json;charset=utf-8');
        request.setMethod('GET');
        HttpResponse response = h.send(request);
        CovidstatusReportTotalwrapper = (CovidstatusReportTotal) JSON.deserialize(response.getBody(), CovidstatusReportTotal.class);
        system.debug('CovidstatusReportTotalwrapper==='+CovidstatusReportTotalwrapper.caseTimeSeries);
        getToatal = CovidstatusReportTotalwrapper.stateWise[0];
        
    }
   
    public class CovidstatusReportTotal{
        public List<caseTimeSeries> caseTimeSeries{get;set;}
        public List<stateWise> stateWise{get;set;}
        public List<tested> tested{get;set;}
    }
    
    public class caseTimeSeries {
        
        public String dailyconfirmed{get; set;}
        public String dailydeceased{get; set;}
        public String dailyrecovered{get; set;}
        public String dateofreport{get; set;}
        public String totalconfirmed{get; set;}
        public String totalrecovered{get; set;}
        
    }
    public class stateWise {
        public String deltarecovered{get; set;}
        public String lastupdatedtime{get; set;}
        public String recovered{get; set;}
        public String state{get; set;}
        public String statecode{get; set;}
        public String statenotes{get; set;}
        public String active {get; set;}
        public String confirmed {get; set;}
        public String deaths {get; set;}
        public String deltaconfirmed {get; set;}
        public string deltadeaths {get; set;}
    }
    public class tested {
        
        public String individualstestedperconfirmedcase{get; set;}
        public String positivecasesfromsamplesreported{get; set;}
        public String samplereportedtoday{get; set;}
        public String source{get; set;}
        public String testpositivityrate{get; set;}
        public String testsconductedbyprivatelabs{get; set;}
        public String testsperconfirmedcase {get; set;}
        public String totalindividualstested {get; set;}
        public String totalpositivecases {get; set;}
        public String totalsamplestested {get; set;}
        public string updatetimestamp {get; set;}
    }
    
    
    
}