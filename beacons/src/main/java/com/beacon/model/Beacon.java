package com.beacon.model;

public class Beacon {

	private String beaconName;
	private AdvertisedId advertisedId;
	private String status;
	private String placeId;
	private LatLng latLng;
	private IndoorLevel indoorLevel;
	private String expectedStability;
	private String description;
	private Properties properties;

	public String getBeaconName() {
		return beaconName;
	}

	public void setBeaconName(String beaconName) {
		this.beaconName = beaconName;
	}

	public AdvertisedId getAdvertisedId() {
		return advertisedId;
	}

	public void setAdvertisedId(AdvertisedId advertisedId) {
		this.advertisedId = advertisedId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPlaceId() {
		return placeId;
	}

	public void setPlaceId(String placeId) {
		this.placeId = placeId;
	}

	public LatLng getLatLng() {
		return latLng;
	}

	public void setLatLng(LatLng latLng) {
		this.latLng = latLng;
	}

	public IndoorLevel getIndoorLevel() {
		return indoorLevel;
	}

	public void setIndoorLevel(IndoorLevel indoorLevel) {
		this.indoorLevel = indoorLevel;
	}

	public String getExpectedStability() {
		return expectedStability;
	}

	public void setExpectedStability(String expectedStability) {
		this.expectedStability = expectedStability;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Properties getProperties() {
		return properties;
	}

	public void setProperties(Properties properties) {
		this.properties = properties;
	}



}
