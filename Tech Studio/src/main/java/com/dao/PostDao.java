package com.dao;

import java.security.Timestamp;
import java.sql.*;
import com.entities.*;
import java.util.ArrayList;
import java.util.List;
public class PostDao {
	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}
	public ArrayList<Category> getAllCategories()
	{
		ArrayList<Category> list= new ArrayList<>();
		
		try {
			
			String query= "select * from categories";
			
			Statement st = this.con.createStatement();
			
			ResultSet set = st.executeQuery(query);
			
			while(set.next())
			{
				int cid = set.getInt("cid");
				String name= set.getString("name");
				String description = set.getString("discription");
				
				Category c = new Category(cid,name,description);
				
				list.add(c);
				
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	public boolean savePost(Post p)
	{
		boolean f = false;
		
		try {
			
			String query = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, p.getpTitle());
			pstmt.setString(2, p.getpContent());
			pstmt.setString(3, p.getpCode());
			pstmt.setString(4, p.getpPic());
			pstmt.setInt(5, p.getCatId());
			pstmt.setInt(6, p.getUserId());
			
			pstmt.executeUpdate();
			f= true;
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return f;
	}

	
	public List<Post> getAllPost()
	{
		List<Post> list = new ArrayList<>();
		
		//fetch all the posts
		
		try {
			PreparedStatement pstmt = con.prepareStatement("select * from posts order by pid desc");
			
			ResultSet set = pstmt.executeQuery();
			
			while(set.next())
			{
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				java.sql.Timestamp date = set.getTimestamp("pDate");
				int catId = set.getInt("catId");
				
				int userId = set.getInt("userId");
				
				Post p = new  Post(pid,  pTitle,  pContent,  pCode,  pPic, null,  catId, userId);
				
				list.add(p);
				
				
			}
			
		}catch(Exception e)
		{
			
		}
		
		
		return list;
	}
	
	public List<Post> getPostByCatId(int catId){
		
		List<Post> list = new ArrayList<>();
		
		//get all posts by id

		try {
			PreparedStatement pstmt = con.prepareStatement("select * from posts where catId=? order by pid desc");
			pstmt.setInt(1, catId);
			ResultSet set = pstmt.executeQuery();
			
			while(set.next())
			{
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				java.sql.Timestamp date = set.getTimestamp("pDate");
			
				
				int userId = set.getInt("userId");
				
				Post p = new  Post(pid,  pTitle,  pContent,  pCode,  pPic, null,  catId, userId);
				
				list.add(p);
				
				
			}
			
		}catch(Exception e)
		{
			
		}
		
		
		
		return list;
		
		
		
	}

	public Post getPostByPostId(int postId)
	{
		String q = "select * from posts where pid=?";
		Post post = null;
		try {
			PreparedStatement pstmt = this.con.prepareStatement(q);
			pstmt.setInt(1, postId);
			ResultSet set = pstmt.executeQuery();
			if(set.next())
			{
				
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				int catId = set.getInt("catId");
				java.sql.Timestamp date = set.getTimestamp("pDate");
			
				
				int userId = set.getInt("userId");
				
				post = new  Post(pid,  pTitle,  pContent,  pCode,  pPic, null,  catId, userId);
				
				
				
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return post;
		
		
	}
	
}


