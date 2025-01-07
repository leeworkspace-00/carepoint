package com.aws.team.domain;

public class BoardVo {

	private int board_pk;
    private String board_type;
    private String subject;
    private String content;
    private String filename;
    private int recom;
    private int viewcnt;
    private String writedate;
    private String modifydate;
    private String ip;
    private String delyn;
    private int origin_num;
    private int level_;
    private String usernick;
    private int user_pk;
    private String uploadedFileName;
   
    public int getBoard_pk() {
       return board_pk;
    }
    public void setBoard_pk(int board_pk) {
       this.board_pk = board_pk;
    }
    public String getBoard_type() {
       return board_type;
    }
    public void setBoard_type(String board_type) {
       this.board_type = board_type;
    }
    public String getSubject() {
       return subject;
    }
    public void setSubject(String subject) {
       this.subject = subject;
    }
    public String getContent() {
       return content;
    }
    public void setContent(String content) {
       this.content = content;
    }
    public String getFilename() {
       return filename;
    }
    public void setFilename(String filename) {
       this.filename = filename;
    } 
    public int getRecom() {
       return recom;
    }
    public void setRecom(int recom) {
       this.recom = recom;
    }
    public int getViewcnt() {
       return viewcnt;
    }
    public void setViewcnt(int viewcnt) {
       this.viewcnt = viewcnt;
    }
    public String getWritedate() {
       return writedate;
    }
    public void setWritedate(String writedate) {
       this.writedate = writedate;
    }
    public String getModifydate() {
       return modifydate;
    }
    public void setModifydate(String modifydate) {
       this.modifydate = modifydate;
    }
    public String getIp() {
       return ip;
    }
    public void setIp(String ip) {
       this.ip = ip;
    }
    public String getDelyn() {
       return delyn;
    }
    public void setDelyn(String delyn) {
       this.delyn = delyn;
    }
    public int getOrigin_num() {
       return origin_num;
    }
    public void setOrigin_num(int origin_num) {
       this.origin_num = origin_num;
    }
    public int getLevel_() {
       return level_;
    }
    public void setLevel_(int level_) {
       this.level_ = level_;
    }
    public String getUsernick() {
       return usernick;
    }
    public void setUsernick(String usernick) {
       this.usernick = usernick;
    }
    public int getUser_pk() {
       return user_pk;
    }
    public void setUser_pk(int user_pk) {
       this.user_pk = user_pk;
    }
    public String getUploadedFileName() {
       return uploadedFileName;
    }
    public void setUploadedFileName(String uploadedFileName) {
       this.uploadedFileName = uploadedFileName;
    }
    
}

