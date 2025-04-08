package C09;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import C04.UserDto;

public class DBUtils {

	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String id = "system";
	private String pw = "1234";

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 싱글톤
	private static DBUtils instance;

	private DBUtils() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, id, pw);
	}

	public static DBUtils getInstance() throws Exception {
		if (instance == null)
			instance = new DBUtils();
		return instance;
	}

	// 3-4
	public int insertUser(UserDto userDto) throws Exception {
		pstmt = conn.prepareStatement("insert into tbl_user values(?,?,?)");
		pstmt.setString(1, userDto.getUserid());
		pstmt.setString(2, userDto.getPassword());
		pstmt.setString(3, userDto.getRole());
		int result = pstmt.executeUpdate();

		conn.commit();
		pstmt.close();
		return result;

	}

	public List<UserDto> selectAllUser() throws Exception {
		pstmt = conn.prepareStatement("select * from tbl_user");
		rs = pstmt.executeQuery();
		List<UserDto> list = new ArrayList();
		UserDto userDto = null;

		if (rs != null) {
			while (rs.next()) {
				userDto = new UserDto();
				userDto.setUserid(rs.getString("userid"));
				userDto.setPassword(rs.getString("password"));
				userDto.setRole(rs.getString("role"));
				list.add(userDto);
			}
		}
		rs.close();
		pstmt.close();
		return list;
	}

	public UserDto selectOneUser(String userid) throws Exception {
	    pstmt = conn.prepareStatement("SELECT * FROM tbl_user WHERE userid = ?");
	    pstmt.setString(1, userid);

	    rs = pstmt.executeQuery();

	    UserDto userDto = null;
	    if (rs.next()) {
	        userDto = new UserDto();
	        userDto.setUserid(rs.getString("userid"));
	        userDto.setPassword(rs.getString("password"));
	        userDto.setRole(rs.getString("role"));
	    }

	    rs.close();
	    pstmt.close();

	    return userDto; 
	}
	public int update(UserDto userDto) throws Exception {
		pstmt = conn.prepareStatement("update tbl_user set password=?, role=? where userid=?");
		pstmt.setString(1, userDto.getPassword());
		pstmt.setString(2, userDto.getRole());
		pstmt.setString(3, userDto.getUserid());
		int result = pstmt.executeUpdate();
		
		conn.commit();
		pstmt.close();
		
		return result;
		
	}
	public int deleteUser(String userid) throws Exception {
		pstmt = conn.prepareStatement("delete from tbl_user where userid=?");
		pstmt.setString(1, userid);
		int result = pstmt.executeUpdate();
		
		conn.commit();
		pstmt.close();
		
		return result;
	}
	public List<OrderDto> selectAllOrder() throws Exception {
		//SQL
//		select category,sum(price * quantity) from tbl_order
//		group by category
//		having sum(price*quantity)>=50000
//		order by sum(price*quantity)desc;
		
		String sql="select category,sum(price * quantity) from tbl_order"
				+ " group by category"
				+ " having sum(price*quantity)>=50000"
				+ " order by sum(price*quantity)desc";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		List<OrderDto> list = new ArrayList();
		OrderDto orderDto = null;

		if (rs != null) {
			while (rs.next()) {
				orderDto = new OrderDto();
				orderDto.setCategory(rs.getString(1));
				orderDto.setSum(rs.getInt(2));
				list.add(orderDto);
			}
		}
		rs.close();
		pstmt.close();
		return list;
	}
	public List<addrDto> selectAlladdr() throws Exception {
		//SQL
		/*
		 * select addr , order_date ,sum(price * quantity) from tbl_user u join
		 * tbl_order o on u.userid = o.userid group by addr,order_date order by addr
		 * asc,sum(price*quantity) desc;
		 */
		
		String sql="select addr , order_date ,sum(price * quantity) from tbl_user u join"
				+ " tbl_order o on u.userid = o.userid group by addr,order_date order by addr"
				+ " asc,sum(price*quantity) desc";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		List<addrDto> list = new ArrayList();
		addrDto addrDto = null;

		if (rs != null) {
			while (rs.next()) {
				addrDto = new addrDto();
				addrDto.setAddr(rs.getString(1));
				addrDto.setOrder_date(rs.getDate(2).toLocalDate());
				addrDto.setSum(rs.getInt(3));
				list.add(addrDto);
			}
		}
		rs.close();
		pstmt.close();
		return list;
	}
	public List<priceDto> selectAllprice() throws Exception {
		//SQL
		/*
		 * select order_date,round(avg(price*quantity),2) from tbl_order group by
		 * order_date;
		 */
		
		String sql="select order_date,round(avg(price*quantity),2)"
				+ " from tbl_order"
				+ " group by order_date";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		List<priceDto> list = new ArrayList();
		priceDto priceDto = null;

		if (rs != null) {
			while (rs.next()) {
				priceDto = new priceDto();
				Timestamp timestamp = rs.getTimestamp(1);
				LocalDate priceDate = timestamp.toLocalDateTime().toLocalDate();
				priceDto.setOrder_date(priceDate);
				priceDto.setRound(rs.getDouble(2));
				list.add(priceDto);
			}
		}
		rs.close();
		pstmt.close();
		return list;
	}
}
