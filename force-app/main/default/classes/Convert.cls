@RestResource(UrlMapping='/Convert/*')
global class Convert {
    @HttpPost
    global static String doPost() {
        RestRequest restReq = RestContext.request;
        BodyWrapper bodyWrap = (BodyWrapper) JSON.deserialize(restReq.requestBody.toString(), BodyWrapper.class);
        
        Map<Integer, List<String>> conversionMap = getMap();
        String response = '';
        String convertStr = bodyWrap.StrToConvert;
        for(Integer i = 0; i < convertStr.length(); ++i) {
            if(convertStr.charAt(i) == ' '.charAt(0)) {
                response += '     ';
            } else {
                List<String> values = conversionMap.get(convertStr.toLowerCase().charAt(i));
                response += values.get(Math.floor(Math.random() * values.size()).intValue());
            }
        }
        return response;
    }
    
   	private static Map<Integer, List<String>> getMap() {
        Map<Integer, List<String>> conversionMap = new Map<Integer, List<String>>();
        List<Emoji__c> emojis = [SELECT Name, Char__c FROM Emoji__c];
        for(Emoji__c emoji : emojis) {
            Integer key = emoji.Char__c.charAt(0);
            if(conversionMap.containsKey(key)) {
                List<String> values = conversionMap.get(key);
                values.add(emoji.Name);
                conversionMap.put(key, values);
            } else {
                List<String> newStrList = new List<String>();
                newStrList.add(emoji.Name);
                conversionMap.put(key, newStrList);
            }
        }
        
        return conversionMap;
    }
    
    private class BodyWrapper {
        public String StrToConvert;
    }
}