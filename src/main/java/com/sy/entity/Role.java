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
public class Role extends Model<Role> {

    private static final long serialVersionUID = 1L;

	private String id;

	/** 角色名称 **/
	private String name;

	/** 编码 **/
	private String code;

	/** 备注 **/
	private String remark;

	/**角色所有用户**/
	private String users;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getUsers() {
		return users;
	}

	public void setUsers(String users) {
		this.users = users;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

}
