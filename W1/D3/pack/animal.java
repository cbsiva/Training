package com.chargebee;

public class animal{
	private String name;

	private static int count = 0;

	public animal(){
		count++;
	}

	public void setName(String name){this.name = name;}

	public String getName(){return name;}

	public int getCount(){return count;}
}