package C09;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class priceDto {
	private LocalDate order_date;
	private Double round;
	
	public priceDto() {
		
	}

	public priceDto(LocalDate order_date, Double round) {
		super();
		this.order_date = order_date;
		this.round = round;
	}

	public LocalDate getOrder_date() {
		return order_date;
	}

	public void setOrder_date(LocalDate order_date) {
		this.order_date = order_date;
	}

	public Double getRound() {
		return round;
	}

	public void setRound(Double round) {
		this.round = round;
	}

	@Override
	public String toString() {
		return "priceDto [order_date=" + order_date + ", round=" + round + "]";
	}
	
}
