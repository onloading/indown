package org.onloading.indown.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.onloading.indown.entity.FreeProxy;
import org.springframework.stereotype.Repository;

@Repository
public interface ProxyMapper {
	@Select("SELECT * FROM free_proxy")
	public List<FreeProxy> query();
}
