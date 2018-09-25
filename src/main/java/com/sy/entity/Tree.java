package com.sy.entity;

public class Tree {
    private String id;
    private String pId;
    private String name;
    private boolean open;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }


    public String getPid() {
        return pId;
    }

    public void setPid(String pid) {
        this.pId = pid;
    }



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isOpen() {
        return open;
    }

    public void setOpen(boolean open) {
        this.open = open;
    }

}
