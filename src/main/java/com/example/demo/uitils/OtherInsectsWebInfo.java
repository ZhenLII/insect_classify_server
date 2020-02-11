package com.example.demo.uitils;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class OtherInsectsWebInfo {
    private final static String HOME = "http://gaga.biodiv.tw";
    private final static String INSECT_INFO_URL = "http://gaga.biodiv.tw/9701bx/in94.htm";
    private final static String INSECT_LIST_URL = "http://gaga.biodiv.tw/new23/";
    private static void getInfo() {
        Document doc = null;
        List<String> urlList = null;
        try {
            // 获取主页
            doc = Jsoup.connect(INSECT_INFO_URL).get();
            // 发现主页中的内容包含在了frame下，所以得获取一层frame
            // 检查页面发现第二个frame是我们需要的信息页面
            Element targetFrame = doc.select("frame[src]").get(1);
            String targetSrc = targetFrame.attr("src");
            targetSrc = targetSrc.replace("..", HOME);
            // 取得信息页面
            doc = Jsoup.connect(targetSrc).get();

            // 匹配逻辑：发现信息页面所有目类前都有一个固定的图标箭头，之后是进入该目下分类的a标签
            Elements allA = doc.select("a:has(img[src=../g16.gif])").next("a");
            // 最后七条暂时不需要
            int stop = allA.size() - 8;
            for(int i = allA.size() - 1;i>stop; i--) {
                allA.remove(i);
            }

            urlList = new ArrayList<>();
            for(Element e : allA) {
                urlList.add(INSECT_LIST_URL.concat(e.attr("href")));
                System.out.println(INSECT_LIST_URL.concat(e.attr("href")));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (urlList != null && urlList.size()>0) {

        }
    }
//    public static void main(String[] args) {
//        getInfo();
//    }
}
