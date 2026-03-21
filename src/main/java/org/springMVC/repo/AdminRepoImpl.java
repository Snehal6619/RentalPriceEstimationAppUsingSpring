package org.springMVC.repo;

import org.springMVC.model.City;
import org.springMVC.model.Inquiry;
import org.springMVC.model.Location;
import org.springMVC.model.Property;
import org.springMVC.model.PropertyDisplay;
import org.springMVC.model.State;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class AdminRepoImpl implements AdminRepo{

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	//inquery
		public int saveInquiry(Inquiry inquiry) {
	        String sql = "INSERT INTO inquiry(name, email, message) VALUES (?, ?, ?)";
	        return jdbcTemplate.update(sql,
	                inquiry.getName(),
	                inquiry.getEmail(),
	                inquiry.getMessage()
	        );
	    }
		
		public boolean existsByStatename(String statename) {
			String sql = "SELECT COUNT(*) FROM state WHERE statename = ?";
	        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, statename);
	        return count != null && count > 0;
		}

		@Override
		public int saveState(State state) {
			 return jdbcTemplate.update(
				        "insert into state(statecode,statename) values(?,?)",
				        state.getStatecode(),
				        state.getStatename()
				    );
		}
		
		public List<State> getStates()
		{
		return jdbcTemplate.query("select * from state",(rs,i)->{

		State s=new State();

		s.setStatecode(rs.getInt("statecode"));
		s.setStatename(rs.getString("statename"));

		return s;

		});
		}
		
		
		public List<City> getCities(int statecode){

			String sql="select * from city where statecode=?";

			return jdbcTemplate.query(sql,new BeanPropertyRowMapper<>(City.class),statecode);

			}

			public void addCity(City c){

			String sql="insert into city(name,statecode) values(?,?)";

			jdbcTemplate.update(sql,c.getName(),c.getStatecode());
			}

			@Override
			public void addLocation(String locationname,int cid){
				String sql="insert into location(locationname,cid) values(?,?)";
				jdbcTemplate.update(sql,locationname,cid);
				}
			@Override
			public void saveLocation(Location loc) {
				
				String sql="insert into location(locationname,cid) values(?,?)";
				jdbcTemplate.update(sql,
				loc.getLocationname(),
				loc.getCid()
				);
				 System.out.println("CID = "+loc.getCid());
				 System.out.println("Location = "+loc.getLocationname());
				
			}

			@Override
			public List<Location> getLocations(int cid) {
				String sql="select * from location where cid=?";

				return jdbcTemplate.query(sql,new BeanPropertyRowMapper<>(Location.class),cid);

			}

			@Override
			public void saveProperty(Property p) {
				String sql="INSERT INTO property(locationcode,area_sqft,bedrooms,bathrooms,parking,metro_distance,price) values(?,?,?,?,?,?,?)";
				jdbcTemplate.update(sql,
						p.getLocationcode(),p.getArea_sqft(),p.getBedrooms(),p.getBathrooms(),p.isParking(),p.getMetro_distance(),p.getPrice()
				);
			}
			
			
			//display proprty
			public List<PropertyDisplay> getAllProperty(){

				String sql="""
				SELECT 
				p.property_id,
				s.statename,
				c.name AS city,
				l.locationname,
				p.area_sqft,
				p.bedrooms,
				p.bathrooms,
				p.parking,
				p.metro_distance,
				p.price
				FROM property p
				JOIN location l ON p.locationcode=l.locationcode
				JOIN city c ON l.cid=c.id
				JOIN state s ON c.statecode=s.statecode
				""";

				return jdbcTemplate.query(sql,(rs,row)->{

				PropertyDisplay p=new PropertyDisplay();

				p.setProperty_id(rs.getInt("property_id"));
				p.setStatename(rs.getString("statename"));
				p.setCity(rs.getString("city"));
				p.setLocationname(rs.getString("locationname"));
				p.setArea_sqft(rs.getFloat("area_sqft"));
				p.setBedrooms(rs.getInt("bedrooms"));
				p.setBathrooms(rs.getInt("bathrooms"));
				p.setParking(rs.getBoolean("parking"));
				p.setMetro_distance(rs.getFloat("metro_distance"));
				p.setPrice(rs.getInt("price"));

				return p;

				});

				}

				//search and delete property
			@Override
			public List<Property> searchProperty(String city) {
				
				 List<Property> list = jdbcTemplate.query(
					        "SELECT p.property_id, s.statename, c.name AS city, l.locationname, " +
					        "p.area_sqft, p.bedrooms, p.bathrooms, p.parking, p.metro_distance, p.price " +
					        "FROM property p " +
					        "JOIN location l ON p.locationcode=l.locationcode " +
					        "JOIN city c ON l.cid=c.id " +
					        "JOIN state s ON c.statecode=s.statecode " +
					        "WHERE c.name LIKE '%" + city + "%'",
					        
					        new RowMapper<Property>() {

					            @Override
					            public Property mapRow(ResultSet rs, int rowNum) throws SQLException {

					                Property p = new Property();

					                p.setProperty_id(rs.getInt("property_id"));
					                p.setStatename(rs.getString("statename"));
					                p.setCity(rs.getString("city"));
					                p.setLocationname(rs.getString("locationname"));
					                p.setArea_sqft(rs.getInt("area_sqft"));
					                p.setBedrooms(rs.getInt("bedrooms"));
					                p.setBathrooms(rs.getInt("bathrooms"));
					                p.setParking(rs.getBoolean("parking"));
					                p.setMetro_distance(rs.getInt("metro_distance"));
					                p.setPrice(rs.getInt("price"));

					                return p;
					            }
					        });

					    return list;
			}

			@Override
			public void deleteProperty(int id) {
			    String sql = "DELETE FROM property WHERE property_id = ?";
			    jdbcTemplate.update(sql, id);
			}
			
			//update
			  public int updateProperty(Property p){
			        String sql = "UPDATE property SET locationcode=?, area_sqft=?, bedrooms=?, bathrooms=?, parking=?, metro_distance=?, price=? WHERE property_id=?";

			        return jdbcTemplate.update(sql,
			                p.getLocationcode(),
			                p.getArea_sqft(),
			                p.getBedrooms(),
			                p.getBathrooms(),
			                p.isParking(),
			                p.getMetro_distance(),
			                p.getPrice(),
			                p.getProperty_id()
			        );
			    }
			  
			  public Property getPropertyById(int id){

				  String sql = "SELECT property_id, locationcode, area_sqft, bedrooms, bathrooms, parking, metro_distance, price FROM property WHERE property_id=?";

				    List<Property> list = jdbcTemplate.query(sql,
				            new BeanPropertyRowMapper<>(Property.class), id);

				    if(list.isEmpty()){
				        return null;
				    }

				    return list.get(0);
				}

			  //inquiry
			  public List<Inquiry> getAllInquiries() {

				    String sql = "SELECT * FROM inquiry ORDER BY id DESC";

				    return jdbcTemplate.query(sql, (rs, rowNum) -> {
				        Inquiry i = new Inquiry();
				        i.setId(rs.getInt("id"));
				        i.setName(rs.getString("name"));
				        i.setEmail(rs.getString("email"));
				        i.setMessage(rs.getString("message"));
				        return i;
				    });
				}
}
