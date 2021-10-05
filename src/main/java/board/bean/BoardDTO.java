package board.bean;

import lombok.Data;

@Data
public class BoardDTO {
	int seq;
	String id;
	String name;
	String email;
	String subject;
	String content;
	int ref;
	int lev;
	int step;
	int pseq;
	int reply;
	int hit;
	String logtime;
}
