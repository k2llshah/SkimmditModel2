package com.skimmdit.bin;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;
import java.util.UUID;

public class SortedMap{
	
	private TreeMap sorted_map;
	
	public TreeMap getSortedmap(HashMap mymap) {
		HashMap<String,Integer> buffer = new HashMap<String,Integer>();
        ValueComparator bvc =  new ValueComparator(buffer);
        TreeMap<String,Integer> sorted_map = new TreeMap<String,Integer>(bvc);

        Iterator it = mymap.keySet().iterator();
        SubmitLinkBean slb;
        UUID key;
		while(it.hasNext())
		{

		key = (UUID) it.next();

		String uuid = key.toString();


		slb = (SubmitLinkBean) mymap.get(key);

		buffer.put(uuid,slb.getVotecounter());

		}
        
        sorted_map.putAll(buffer);
        return sorted_map;
	}	
	
}
