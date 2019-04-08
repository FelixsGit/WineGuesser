package toppar.wine_guesser.util;

import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.DomText;
import com.gargoylesoftware.htmlunit.html.HtmlAnchor;
import com.gargoylesoftware.htmlunit.html.HtmlElement;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

import java.sql.SQLOutput;
import java.util.ArrayList;
import java.util.List;

public class UrlScanner {

    public List<String> findDescriptionsForAllUrls(List<String> urls){
        List<String> descriptions = new ArrayList<>();
        for(int i = 0; i < urls.size(); i++){
            descriptions.add(findSpecificDescriptionForSpecificUrl(urls.get(i)));
        }
        return descriptions;

    }

    private String findSpecificDescriptionForSpecificUrl(String url){
        WebClient client = new WebClient();
        client.getOptions().setCssEnabled(false);
        client.getOptions().setJavaScriptEnabled(false);
        String sent = "";
        String taste = "";
        boolean foundSent = false;
        boolean foundTaste = false;
        try {
            HtmlPage page = client.getPage(url);;
            List<HtmlElement> htmlElements = page.getByXPath("//*[@id=\"description\"]/b");
            for(HtmlElement item : htmlElements){
                if(foundSent && foundTaste){
                    break;
                }
                if(!foundSent){
                    if(item.asText().equals("Arom:")) {
                        sent = item.getNextSibling().asText();
                        foundSent = true;
                    }
                }
                if(!foundTaste){
                    if(item.asText().equals("Smak:")){
                        taste = item.getNextSibling().asText();
                        foundTaste = true;
                    }
                }
            }
            if(foundSent && foundTaste){
                return "Doft: "+sent+"\nSmak: "+taste;
            }else if(foundSent){
                return "Doft: "+sent;
            }else if(foundTaste){
                return "Smak: "+taste;
            }else{
                return "";
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
