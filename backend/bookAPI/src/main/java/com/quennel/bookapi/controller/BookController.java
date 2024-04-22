package com.quennel.bookapi.controller;

import com.quennel.bookapi.models.Book;
import com.quennel.bookapi.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookRepository bookRepository;

    @PostMapping
    public Book save(@RequestBody Book book) {
        return bookRepository.save(book);
    }

    @GetMapping
    public List<Book> findAll() {
        return bookRepository.findAll();
    }
}
