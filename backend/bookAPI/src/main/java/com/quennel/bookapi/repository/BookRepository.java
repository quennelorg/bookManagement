package com.quennel.bookapi.repository;

import com.quennel.bookapi.models.Book;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface BookRepository extends MongoRepository<Book, Long> {
}
