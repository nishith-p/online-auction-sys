package com.onlineauction.service;

import java.util.List;

import com.onlineauction.model.Review;

public interface IReviewService {
	
	public void addReview(Review rev);
	
	public List<Review> getAllReviews(int auctionId);

}
