package com.springbook.biz.gallery;


import org.springframework.data.jpa.repository.JpaRepository;

public interface  GalleryRepository extends JpaRepository<Gallery, Integer> {

//	Files findByFno(int fno);
}