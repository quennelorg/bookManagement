package com.quennel.bookapi.service;

import com.quennel.bookapi.models.Book;
import com.quennel.bookapi.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BookService {
    @Autowired
    private BookRepository bookRepository;

    public Book save(Book book) {
        if(bookRepository.existsById(book.getId())) {
            return null;
        }
        return bookRepository.save(book);
    }

    public List<Book> findAll() {
        return bookRepository.findAll();
    }

    public Optional<Book> findById(Long id) {
        return bookRepository.findById(id);
    }

    public List<Book> deleteById(Long id) {
        if (bookRepository.existsById(id)) {
            bookRepository.deleteById(id);
            return bookRepository.findAll();
        }
        return null;
    }
}
