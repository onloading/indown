package org.onloading.indown.service;

import java.util.List;

import org.onloading.indown.entity.FreeProxy;
import org.onloading.indown.mapper.ProxyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProxyService {
	@Autowired
	private ProxyMapper proxyMapper;

	public List<FreeProxy> query() {
		return proxyMapper.query();
	}
}
