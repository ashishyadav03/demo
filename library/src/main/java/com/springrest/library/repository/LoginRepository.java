package com.springrest.library.repository;

 
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.springrest.library.model.Login;

 

@Repository
public interface LoginRepository extends JpaRepository<Login, String>{

}
