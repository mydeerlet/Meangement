package utils;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import login.UserBean;

import bean.SecondCarBean;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class UserRegister {

	private UserBean userBean;
	private Connection con;

	// 获得数据库连接。
	public UserRegister() {

		String JDBC_DRIVER = "com.mysql.jdbc.Driver";
		String DB_URL = "jdbc:mysql://localhost:3306/car66?useUnicode=true&characterEncoding=utf8";

		// 数据库的用户名与密码，需要根据自己的设置
		String USER = "mydeerlet";
		String PASS = "123456....";
		// 注册 JDBC 驱动
		try {
			Class.forName("com.mysql.jdbc.Driver");

			con = (Connection) DriverManager.getConnection(DB_URL, USER, PASS);
			System.out.println("链接成功");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 设置待注册的用户信息。
	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}

	// 进行注册
	public void regist() throws Exception {

		String reg = "insert into user(oppen_id,password)  values(?,?)";
		PreparedStatement pstmt = con.prepareStatement(reg);
		pstmt.setString(1, userBean.getUserid());
		pstmt.setString(2, userBean.getPassword());
		pstmt.executeUpdate();
	}

	// 登陆校验
	public boolean LonginCheck(String username, String password) {

		try {
			String sql = "select * from user where oppen_id='" + username
					+ "';";
			Statement stmt = (Statement) con.createStatement();
			ResultSet resultSet = stmt.executeQuery(sql);

			if (resultSet.next()) {
				String passwordR = new String(resultSet.getString("password"));
				// System.out.println(passwordR);
				if (passwordR.equals(password)) {
					System.out.println(passwordR);
					return true;
				} else {
					return false;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	//查询二手车分期会员
	public Object T (String tableName) {
		
		try {
			String sql = "select * from " +tableName+";";
			Statement stmt = (Statement) con.createStatement();
			ResultSet resultSet = stmt.executeQuery(sql);
			
			if (tableName.equals("second_car")) {
				SecondCarBean secCar= new SecondCarBean();
				while (resultSet.next()) {
					secCar.setName(resultSet.getString(0));
					secCar.setNumber(resultSet.getString(1));
					secCar.setID_number(resultSet.getString(2));
					secCar.setMarry(resultSet.getInt(3));
					secCar.setMotorcycle_type(resultSet.getString(4));
					secCar.setUnit(resultSet.getString(5));
				}
				return secCar;	
			}
			
			return null;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
		
	}
	
}
