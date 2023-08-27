package com.Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.TodoDao;
import com.bean.Bean;
import com.database.DBconnection;

/**
 * Servlet implementation class Updatetask
 */
@WebServlet("/Updatetask")
public class Updatetask extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Updatetask() {
        super();
        // TODO Auto-generated constructor stub
    }
    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id=Integer.parseInt(request.getParameter("id"));
		String task= request.getParameter("task");
		String status=request.getParameter("status");
		
		Bean bn= new Bean(); 
		bn.setId(id);
		bn.setTask(task);
		bn.setStatus(status); 
		System.out.println(id + " "+ task+" "+status);
		
		try {
			TodoDao dao= new TodoDao(DBconnection.getconn());
			dao.updatetodo(bn);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("index.jsp");
	}

}
