package com.vti.exam.response;

public enum ResponseCode {
	CODE_100(401, "NOT EXISTS"),
	CODE_204(204, "NO DATA "),
	CODE_300(403, "UNKNOWN ERROL"),
	CODE_200(200, "SUCCESS"),
	CODE_001(100, "FAILURE REQUEST"), 
	CODE_002(102, "DUPLICATE DATA"), 
	CODE_003(103, "INPUT PARAMETER ERROL"),
	CODE_004(104,"ERROL WITH INPUT"),
	CODE_007(104,"REQUEST FULL INFORMATION TO CREATE"),
	CODE_005(105,"Admin Cannot Be Deleted"),
	CODE_006(106,"Not Exists Data , It may have been deleted in the past");
	

	
	public int code;
	public String message;
	ResponseCode(int i, String string) {
		this.code = i;
		this.message = string;
	}


}
