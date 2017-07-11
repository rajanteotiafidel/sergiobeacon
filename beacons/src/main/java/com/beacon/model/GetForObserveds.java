package com.beacon.model;

import java.util.List;

public class GetForObserveds {
	
	
	private List<Observations> observations;
	private List<String> namespacedTypes;
	
	
	public List<Observations> getObservations() {
		return observations;
	}
	public void setObservations(List<Observations> observations) {
		this.observations = observations;
	}
	public List<String> getNamespacedTypes() {
		return namespacedTypes;
	}
	public void setNamespacedTypes(List<String> namespacedTypes) {
		this.namespacedTypes = namespacedTypes;
	}
	
	
}
