package org.springMVC.repo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springMVC.model.Property;
import org.springMVC.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class UserRepoImpl implements UserRepo {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public User findByUserName(String username) {

		List<User> list = jdbcTemplate.query("select * from user where username=?", // check krt username present ahe ka
																					// nahi
				new BeanPropertyRowMapper<>(User.class), username);
		if (list.isEmpty()) {
			return null;
		} else {
			return list.get(0); // 0-user 1-password
		}
	}

	@Override
	public boolean existsByUsername(String username) {
		String sql = "SELECT COUNT(*) FROM user WHERE username = ?";
		Integer count = jdbcTemplate.queryForObject(sql, Integer.class, username);
		return count != null && count > 0;
	}

	@Override
	public int save(User user) {

		return jdbcTemplate.update("insert into user(username,email,contact,password) values(?,?,?,?)",
				user.getUsername(), user.getEmail(), user.getContact(), user.getPassword());

	}

	@Override
	public List<User> display() {

		List<User> list = jdbcTemplate.query("select * from user where role='USER'", new RowMapper<User>() {

			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User e = new User();
				e.setId(rs.getInt(1));
				e.setUsername(rs.getString(2));
				e.setEmail(rs.getString(3));
				e.setContact(rs.getString(4));
				e.setPassword(rs.getString(5));
				e.setRole(rs.getString(6));
				return e;
			}
		});
		return list;
	}

	@Override
	public void delete(int id) {

		jdbcTemplate.update("delete from user where id=?", id);
	}

	@Override
	public List<User> search(int id) {

		List<User> list = jdbcTemplate.query("select * from user where id=?", new RowMapper<User>() {

			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User e = new User();
				e.setId(rs.getInt(1));
				e.setUsername(rs.getString(2));
				e.setEmail(rs.getString(3));
				e.setContact(rs.getString(4));
				e.setPassword(rs.getString(5));
				e.setRole(rs.getString(6));
				return e;
			}
		}, id); // query(sql,rowMapper,paramter(?)
		return list;
	}

	@Override
	public List<Map<String, Object>> getStates() {
		return jdbcTemplate.queryForList("select * from state");
	}

	@Override
	public List<Map<String, Object>> getCities(int statecode) {
		return jdbcTemplate.queryForList("select * from city where statecode=?", statecode);
	}

	@Override
	public List<Map<String, Object>> getLocations(int cid) {
		return jdbcTemplate.queryForList("select * from location where cid=?", cid);
	}

	@Override
	public int saveProperty(Map<String, Object> d) {
		return jdbcTemplate.update(
				"insert into property(locationcode,area_sqft,bedrooms,bathrooms,parking,metro_distance) values(?,?,?,?,?,?)",
				d.get("locationcode"), d.get("area_sqft"), d.get("bedrooms"), d.get("bathrooms"), d.get("parking"),
				d.get("metro_distance"));
	}
	@Override
	public List<Property> getAllProperties() {

	    String sql = "SELECT * FROM property";

	    return jdbcTemplate.query(sql, (rs, rowNum) -> {

	        Property p = new Property();

	        p.setProperty_id(rs.getInt("property_id"));
	        p.setLocationcode(rs.getInt("locationcode"));

	        p.setArea_sqft(rs.getFloat("area_sqft"));
	        p.setBedrooms(rs.getInt("bedrooms"));
	        p.setBathrooms(rs.getInt("bathrooms"));

	        // parking (0/1 handle)
	        p.setParking(rs.getBoolean("parking"));

	        p.setMetro_distance(rs.getFloat("metro_distance"));

	        p.setPrice(rs.getInt("price"));

	        return p;
	    });
	}
}
