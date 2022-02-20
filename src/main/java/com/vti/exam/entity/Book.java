package com.vti.exam.entity;


import lombok.Data;

import javax.persistence.*;  
import java.util.Set;  
import java.util.stream.Collectors;  
import java.util.stream.Stream;

@Data
@Entity
public class Book {  
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "book", cascade = CascadeType.ALL)
    private Set<BookPublisher> bookPublishers;

    public Book(String name, BookPublisher... bookPublishers) {
        this.name = name;
        for(BookPublisher bookPublisher : bookPublishers) bookPublisher.setBook(this);
        this.bookPublishers = Stream.of(bookPublishers).collect(Collectors.toSet());
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<BookPublisher> getBookPublishers() {
		return bookPublishers;
	}

	public void setBookPublishers(Set<BookPublisher> bookPublishers) {
		this.bookPublishers = bookPublishers;
	}

	public Book(int id, String name, Set<BookPublisher> bookPublishers) {
		super();
		this.id = id;
		this.name = name;
		this.bookPublishers = bookPublishers;
	}

	public Book() {
		super();
	}
    
}

