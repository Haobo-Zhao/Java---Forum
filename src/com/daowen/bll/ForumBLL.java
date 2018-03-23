package com.daowen.bll;

import java.text.MessageFormat;
import java.util.List;


import com.daowen.dal.DALBase;
import com.daowen.entity.Bankuai;
import com.daowen.entity.Topic;


public class ForumBLL {
	
	
	public  List<Bankuai> getBankuais(int bkid){
		
		
		String SQL=MessageFormat.format("select * from  bankuai   where parentid={0}  ",bkid);
		List<Bankuai> list=DALBase.runNativeSQL(SQL,Bankuai.class);
		
		return list;
				
	}
	
    public  int getTopiccount(int blockid){
				 
	    return DALBase.selectCount("select count(*) topiccount from topic where bkid="+blockid+" and  istopic=1");
	    
	}
	
    public  int getPostcount(int blockid){
			     
       return DALBase.selectCount("select count(*) topiccount from topic where bkid="+blockid+" and  istopic=0");
	    
	}
    
    public  Topic getLastTopic(int blockid){
		
    	String nativesql="select   *  from topic where bkid="+blockid+" and  istopic=1  order by pubtime desc limit 1";
    	
    	List result= DALBase.runNativeSQL(nativesql, Topic.class);
		if(result.size()>0)
	      return (Topic)result.get(0);
	    
		return null;
	}
    
    
    public  Topic getLastPost(int topicid){
		
        String nativesql="select   *  from topic where replyid="+topicid+" and  istopic=0  order by pubtime desc limit 1";
    	
    	List result= DALBase.runNativeSQL(nativesql, Topic.class);
		if(result.size()>0)
	      return (Topic)result.get(0);
	    
		return null;
		
		
	}
      
    public int getTodayPostcount(int blockid){
    	
    	
         return DALBase.selectCount("select count(*) topiccount from topic where bkid="+blockid+" and date(pubtime)= curdate() ");
	     
    	
    }
	

}
