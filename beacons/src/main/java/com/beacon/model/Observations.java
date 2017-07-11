package com.beacon.model;

import java.util.List;

public class Observations {
	
	private AdvertisedId advertisedId;
	private String telemetry;
	private String timestampMs;

	public AdvertisedId getAdvertisedId() {
		return advertisedId;
	}

	public void setAdvertisedId(AdvertisedId advertisedId) {
		this.advertisedId = advertisedId;
	}
	
	public String getTelemetry() {
		return telemetry;
	}

	public void setTelemetry(String telemetry) {
		this.telemetry = telemetry;
	}

	public String getTimestampMs() {
		return timestampMs;
	}

	public void setTimestampMs(String timestampMs) {
		this.timestampMs = timestampMs;
	}	
}
