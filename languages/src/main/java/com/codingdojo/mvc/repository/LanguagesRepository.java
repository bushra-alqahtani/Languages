package com.codingdojo.mvc.repository;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.codingdojo.mvc.models.Languages;

@Repository
public interface LanguagesRepository extends CrudRepository<Languages, Long>{
	List<Languages> findAll();
}
