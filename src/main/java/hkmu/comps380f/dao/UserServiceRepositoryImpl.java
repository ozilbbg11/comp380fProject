/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hkmu.comps380f.dao;

import hkmu.comps380f.model.LectureUser;
import hkmu.comps380f.model.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author User
 */
@Repository
public class UserServiceRepositoryImpl implements UserService{
    private final JdbcOperations jdbcOp;
    
    @Autowired
    public UserServiceRepositoryImpl(DataSource dataSource) {
        jdbcOp = new JdbcTemplate(dataSource);
    }
    
    private static final class UserSerExtractor implements ResultSetExtractor<List<User>> {

        @Override
        public List<User> extractData(ResultSet rs)
                throws SQLException, DataAccessException {
            Map<String, User> map = new HashMap<>();
            while (rs.next()) {
                String username = rs.getString("username");
                User user = map.get(username);
                if (user == null) {
                    user = new User();
                    user.setUsername(username);
                    user.setPassowrd(rs.getString("password"));
                    user.setFull_Name(rs.getString("full_Name"));
                    user.setPhone_Number(rs.getString("phone_Number"));
                    user.setAddress(rs.getString("address"));
                    map.put(username, user);
                }
            }
            return new ArrayList<>(map.values());
        }
    }
    @Override
    @Transactional
    public void save(User user){
        final String SQL_INSERT_USER
                = "insert into users (username, password, full_name, phone_number, address) values (?, ?, ?, ?, ?)";
        final String SQL_INSERT_ROLE
                = "insert into user_roles (username, role) values (?, ?)";
        jdbcOp.update(SQL_INSERT_USER, user.getUsername(), user.getPassowrd(), user.getFull_Name(), user.getPhone_Number(), user.getAddress());
        System.out.println("User " + user.getUsername() + " inserted");

        jdbcOp.update(SQL_INSERT_ROLE, user.getUsername(), "ROLE_USER");
    }
    
    @Override
    @Transactional(readOnly = true)
    public List<User> findAll() {
        final String SQL_SELECT_USERS
                = "select users.*, user_roles.role from users, user_roles"
                + " where users.username = user_roles.username";
        return jdbcOp.query(SQL_SELECT_USERS, new UserServiceRepositoryImpl.UserSerExtractor());
    }
}
