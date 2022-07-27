package com.codingdojo.mvc.services;

import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Service;
import com.codingdojo.mvc.models.Languages;
import com.codingdojo.mvc.repository.LanguagesRepository;

@Service
public class LanguagesService {
    // adding the languages repository as a dependency
	private final LanguagesRepository languagesRepository;
	
	public LanguagesService(LanguagesRepository languagesRepository) {
		this.languagesRepository=languagesRepository;
	}
	
	// returns all the Lang
	
	public List<Languages> getAllLanguages(){
		return languagesRepository.findAll();
	}
	
	// creates a Languages
    public Languages createLanguages(Languages b) {
        return languagesRepository.save(b);
    }
    
  //get Languages by id 
    public Optional<Languages> getLanguagesById(Long id) {
    	return languagesRepository.findById(id);
    }
    
 // retrieves a Languages 
    public Languages findLanguages(Long id) {
       Optional<Languages> optional = languagesRepository.findById(id);
        if(optional.isPresent()) {
           return optional.get();
        } else {
            return null;
        }
    }
	
    
 // update Languages
    public Languages updateLanguages(Long id,Languages b) {
    	Optional<Languages> obtional=languagesRepository.findById(id);
    	if(obtional.isPresent()) {
    		Languages lang =obtional.get();
    		lang.setName(b.getName());
    		lang.setCreator(b.getCreator());
    		lang.setVersion(b.getVersion());
    		languagesRepository.save(lang);
    	}
    	return null; 
    }
	
	
 //delete
    
    public boolean deleteLanguages(Long id) {
    	Languages remove = findLanguages(id);
    	if(remove==null) {
    		return false;
    		}
    	languagesRepository.delete(remove);
    	return true;
    }


	
}
