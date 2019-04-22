package toppar.wine_guesser.util;

import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlElement;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import toppar.wine_guesser.domain.WineryException;

import java.util.ArrayList;
import java.util.List;

public class UrlScanner {

    public List<String> findDescriptionsForAllUrls(List<String> urls) throws WineryException {
        List<String> descriptions = new ArrayList<>();
        for(int i = 0; i < urls.size(); i++){
            if(urls.get(i).contains("systembolaget")){
                descriptions.add(findSpecificDescriptionForSpecificUrlSystemBolaget(urls.get(i)));
            }else{
                descriptions.add(findSpecificDescriptionForSpecificUrlBodegaShop(urls.get(i)));
            }
        }
        return descriptions;

    }

    public String getRegionFromUrl(String url){
        try {
            WebClient client = new WebClient();
            client.getOptions().setCssEnabled(false);
            client.getOptions().setJavaScriptEnabled(false);
            try {
                HtmlPage page = client.getPage(url);
                List<HtmlElement> htmlElements = page.getByXPath("//*[contains(@class, 'area')]");
                for (HtmlElement item : htmlElements) {
                    String text = item.asText();
                    if(text.contains("\n")){
                        String urlText = text.substring(2);
                        for(int i = 0; i < urlText.length(); i++){
                            if(String.valueOf(urlText.charAt(i)).equals("\r")){
                                return urlText.substring(0, i);
                            }
                        }

                    }
                    return text.substring(2);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }catch(FailingHttpStatusCodeException e){
            e.printStackTrace();
        }
        return "lol";
    }

    private String findSpecificDescriptionForSpecificUrlSystemBolaget(String url) throws WineryException {
        try {
            WebClient client = new WebClient();
            client.getOptions().setCssEnabled(false);
            client.getOptions().setJavaScriptEnabled(false);
            String sent = "";
            String taste = "";
            boolean foundSent = false;
            boolean foundTaste = false;
            try {
                HtmlPage page = client.getPage(url);
                List<HtmlElement> htmlElements = page.getByXPath("//*[contains(@class, 'description ')]");
                for (HtmlElement item : htmlElements) {
                    if (item.getFirstChild().asText().contains("smak")) {
                        taste = item.getFirstChild().asText();
                        taste.indexOf("Serveras", 0);
                        foundTaste = true;
                        StringBuilder sb = new StringBuilder(taste);
                        sb.delete(taste.indexOf("Serveras", 0), taste.length());
                        taste = sb.toString();
                        break;
                    }
                }

                htmlElements = page.getByXPath("//*[@id=\"destopview\"]/ul/li[4]/p");
                for (HtmlElement item : htmlElements) {
                    if (item.getFirstChild().asText().contains("doft")) {
                        sent = item.getFirstChild().asText();
                        foundSent = true;
                        break;
                    }

                }

                if (foundSent && foundTaste) {
                    return "Smak: " + taste + "\n\nDoft: " + sent;
                } else if (foundSent) {
                    return "Doft: " + sent;
                } else if (foundTaste) {
                    return "Smak: " + taste;
                } else {
                    return "";
                }
            } catch (Exception e) {
                throw new WineryException("Systembolaget down");
            }
        }catch(FailingHttpStatusCodeException e){
            throw new WineryException("Systembolaget down");
        }
    }

    private String findSpecificDescriptionForSpecificUrlBodegaShop(String url) throws WineryException {
        try {
            WebClient client = new WebClient();
            client.getOptions().setCssEnabled(false);
            client.getOptions().setJavaScriptEnabled(false);
            String sent = "";
            String taste = "";
            boolean foundSent = false;
            boolean foundTaste = false;
            try {
                HtmlPage page = client.getPage(url);
                ;
                List<HtmlElement> htmlElements = page.getByXPath("//*[@id=\"description\"]/b");
                for (HtmlElement item : htmlElements) {
                    if (foundSent && foundTaste) {
                        break;
                    }
                    if (!foundSent) {
                        if (item.asText().equals("Arom:")) {
                            sent = item.getNextSibling().asText();
                            foundSent = true;
                        }
                    }
                    if (!foundTaste) {
                        if (item.asText().equals("Smak:")) {
                            taste = item.getNextSibling().asText();
                            foundTaste = true;
                        }
                    }
                }
                if (foundSent && foundTaste) {
                    return "Smak: " + taste + "\n\nDoft: " + sent;
                } else if (foundSent) {
                    return "Doft: " + sent;
                } else if (foundTaste) {
                    return "Smak: " + taste;
                } else {
                    return "";
                }
            } catch (Exception e) {
                throw new WineryException("Bodegashop down");
            }
        }catch(FailingHttpStatusCodeException e){
            throw new WineryException("Bodegashop down");
        }
    }

    public static String getImageSourceStringFromUrl(String url) throws WineryException {
        String imgSourceString = null;
        try {
            WebClient client = new WebClient();
            client.getOptions().setCssEnabled(false);
            client.getOptions().setJavaScriptEnabled(false);
            HtmlPage page = client.getPage(url);
            List<HtmlElement> htmlElements = page.getByXPath("//*[@id=\"product-image-carousel\"]/div/div[1]");
            imgSourceString = htmlElements.get(0).getFirstChild().getNextSibling().getAttributes().item(0).getNodeValue();
        } catch (Exception e) {
            throw new WineryException("Systembolaged img failure");
        }
        return imgSourceString;

    }

}
