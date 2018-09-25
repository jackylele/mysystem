package com.sy.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import java.io.Serializable;


/**
 * <p>
 * 
 * </p>
 *
 * @author SPF
 * @since 2018-03-11
 */
public class Permission extends Model<Permission> {

    private static final long serialVersionUID = 1L;

	private String id;

	/** 菜单名称 **/
	private String name;

	/** 菜单编码 **/
	private String skey;

	/** 菜单是否显示 **/
	private Integer hide;

	/** URL **/
	private String url;

	/** 显示顺序 **/
	private Integer sort;

	/** 父菜单编码 **/
	private String parentKey;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getKey() {
		return skey;
	}

	public void setKey(String key) {
		this.skey = key;
	}

	public Integer getHide() {
		return hide;
	}

	public void setHide(Integer hide) {
		this.hide = hide;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getParentKey() {
		return parentKey;
	}

	public void setParentKey(String parentKey) {
		this.parentKey = parentKey;
	}


	@Override
	protected Serializable pkVal() {
		return this.id;
	}

}
