package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.Bean;

public class TodoDao {
	
	public Connection conn;

	public TodoDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public void addTodo(String task,String status) throws SQLException
	{
		String str="insert into todotask(task,status) values(?,?) ";
		PreparedStatement ps= conn.prepareStatement(str);
		ps.setString(1, task);
		ps.setString(2, status);
		
		ps.execute();
		conn.close();
	}
	 
	public List<Bean> getTodo() throws SQLException
	{
		List<Bean> list= new ArrayList<Bean>();
		Bean bn=null;
		
		String str= "select * from todotask";
		PreparedStatement ps=conn.prepareStatement(str);
		
		ResultSet rs=ps.executeQuery();
		while(rs.next()) 
		{
			bn=new Bean();
			bn.setId(rs.getInt(1));
			bn.setTask(rs.getString(2));
			bn.setStatus(rs.getString(3)); 
			list.add(bn); 
		}
		return list;
	}
	
	public Bean getid(int id) throws SQLException
	{
		Bean bn= null;
		
		String str="select * from todotask where id=?";
		PreparedStatement ps= conn.prepareStatement(str);
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			bn= new Bean();
			bn.setId(rs.getInt(1));
			bn.setTask(rs.getString(2));
			bn.setStatus(rs.getString(3)); 
		}
		
		return bn;
	}
	
	public void updatetodo(Bean bn) throws SQLException
	{
		String str= "update todotask set task=?, status=? where id=?";
		PreparedStatement ps= conn.prepareStatement(str);
		ps.setString(1, bn.getTask());
		ps.setString(2, bn.getStatus());
		ps.setInt(3, bn.getId());
		
		ps.executeUpdate();
		conn.close();
	}
	
	public void deletetodo(int id) throws SQLException
	{
		String str="delete from todotask where id=?";
		PreparedStatement ps = conn.prepareStatement(str);
		
		ps.setInt(1, id);
		
		ps.execute();
		conn.close();
	}
	
}
