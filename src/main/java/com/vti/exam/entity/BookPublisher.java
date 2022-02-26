package com.vti.exam.entity;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

@Getter
@Setter
@NoArgsConstructor
@Entity
public class BookPublisher {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "book_id")
	private Book book;

	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "publisher_id")
	private Publisher publisher;

	private Date publishedDate;

	public BookPublisher(Publisher publisher, Date publishedDate) {
		this.publisher = publisher;
		this.publishedDate = publishedDate;
	}

	public BookPublisher() {
		super();
	}

	public BookPublisher( Book book, Publisher publisher, Date publishedDate) {
		super();
		
		this.book = book;
		this.publisher = publisher;
		this.publishedDate = publishedDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Publisher getPublisher() {
		return publisher;
	}

	public void setPublisher(Publisher publisher) {
		this.publisher = publisher;
	}

	public Date getPublishedDate() {
		return publishedDate;
	}

	public void setPublishedDate(Date publishedDate) {
		this.publishedDate = publishedDate;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (!(o instanceof BookPublisher))
			return false;
		BookPublisher that = (BookPublisher) o;
		return Objects.equals(book.getName(), that.book.getName())
				&& Objects.equals(publisher.getName(), that.publisher.getName())
				&& Objects.equals(publishedDate, that.publishedDate);
	}

	@Override
	public int hashCode() {
		return Objects.hash(book.getName(), publisher.getName(), publishedDate);
	}
}
