package model;

import java.util.ArrayList;
import java.util.List;

public class SearchList {

    private static SearchList instance = new SearchList();

    private List<Product> model;




    public static SearchList getInstance() {
        return instance;
    }

    private SearchList() {
        model = new ArrayList<>();
    }

    public void add(Product product) {
        model.add(product);
    }
    public void remove(Product product) { model.remove(product); }

    public List<Product> list() {
       return (List<Product>) instance;

    }

}
