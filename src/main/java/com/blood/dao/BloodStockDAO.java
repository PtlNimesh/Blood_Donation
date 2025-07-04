package com.blood.dao;

import java.util.List;

import com.blood.model.BloodStock;

public interface BloodStockDAO {
    List<BloodStock> getStocks(String centerId, String bloodType);

    boolean addStock(BloodStock stock);

}
