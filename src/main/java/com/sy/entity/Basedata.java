package com.sy.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import java.util.Date;
import java.io.Serializable;


/**
 * <p>
 * 
 * </p>
 *
 * @author SPF
 * @since 2018-03-06
 */
public class Basedata extends Model<Basedata> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 仰角
     */
	private Float elevation;
    /**
     * 距离
     */
	private Float distance;
    /**
     * 真实距离
     */
	private Float realdistace;
    /**
     * 高度
     */
	private Float high;
    /**
     * 备注
     */
	private String marks;
    /**
     * 采样时间
     */
	private Date sampletime;

	/**
	 * 开始时间
	 * @return
	 */
	private String starttime;
	/**
	 * 结束时间
	 * @return
	 */
	private String endtime;

	private Integer limit;

	/**
	 * 阈值
	 * @return
	 */
	private String  threshold;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Float getElevation() {
		return elevation;
	}

	public void setElevation(Float elevation) {
		this.elevation = elevation;
	}

	public Float getDistance() {
		return distance;
	}

	public void setDistance(Float distance) {
		this.distance = distance;
	}

	public Float getRealdistace() {
		return realdistace;
	}

	public void setRealdistace(Float realdistace) {
		this.realdistace = realdistace;
	}

	public Float getHigh() {
		return high;
	}

	public void setHigh(Float high) {
		this.high = high;
	}

	public String getMarks() {
		return marks;
	}

	public void setMarks(String marks) {
		this.marks = marks;
	}

	public Date getSampletime() {
		return sampletime;
	}

	public void setSampletime(Date sampletime) {
		this.sampletime = sampletime;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	public String getThreshold() {
		return threshold;
	}

	public void setThreshold(String threshold) {
		this.threshold = threshold;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

}
