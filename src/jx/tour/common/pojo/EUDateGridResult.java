package jx.tour.common.pojo;

import java.util.List;

/*Easyui返回的数据封装到此Pojo对象中*/
/*Easyui中datagrid控件要求的数据格式为：
{total:”2”,rows:[{“id”:”1”,”name”,”张三”},{“id”:”2”,”name”,”李四”}]}
*/
public class EUDateGridResult {
	private long total;
	private List<?> rows;
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public List<?> getRows() {
		return rows;
	}
	public void setRows(List<?> rows) {
		this.rows = rows;
	}
	
}
