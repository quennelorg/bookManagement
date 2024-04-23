package com.quennel.bookapi.controller;

import com.quennel.bookapi.models.Book;
import com.quennel.bookapi.service.BookService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/book")
public class BookController {

    private final BookService bookService;

    public BookController(BookService bookService) {
        this.bookService = bookService;
    }

    @PostMapping
    public Book save(@RequestBody Book book) {
        return bookService.save(book);
    }

    @GetMapping
    public List<Book> findAll() {
        return bookService.findAll();
    }

    @DeleteMapping
    public List<Book> deleteById(@RequestParam Long id) {
        return bookService.deleteById(id);
    }
}
