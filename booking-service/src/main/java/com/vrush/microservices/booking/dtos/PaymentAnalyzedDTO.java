package com.vrush.microservices.booking.dtos;

import com.vrush.microservices.booking.enums.BookingStateEnum;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.UUID;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PaymentAnalyzedDTO implements Serializable {

    private UUID idBooking;
    private BookingStateEnum state;

}
