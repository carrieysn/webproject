package supplierCentre;
import java.util.HashMap;
import java.util.Map;

import com.meitianhui.platform.utils.HttpClientUtil;

import net.sf.json.JSONObject;
public class Test {
	
	public static void main(String[] args) {
		testAddPreSupplier();
	}
	
	public static void testAddPreSupplier(){
		Map<String, String> params = new HashMap<String, String>();
		params.put("supplier_name", "testname123");
		params.put("area_id", "ebb41d1a-bb51-11e5-a4b3-00163e0009c6");
		params.put("address", "tst33");
		params.put("contact_person", "test");
		params.put("contact_tel", "13794112410");
		params.put("title", "dsfsdfdf");
		params.put("pic_detail_info", "http://test-mps.meitianhui.com/omp-mth-productSpecialist/product/index");
		//String pic_info = ("[{\"path_id\":\"a18c51ce1c2c46d399a0393b73167f41\",\"title\":\"hello!\"}]");
		String pic_info = ("[{\"path_id\":\"9dd4b265a0354ba9ab289bf1ca36e30f\",\"title\":\"\"},{\"path_id\":\"4a778afe3c3c4f1c8d58f7d53efa5046\",\"title\":\"\"},{\"path_id\":\"41a212a0c4a64470baa282db287dbfa8\",\"title\":\"\"}]");
		params.put("pic_info", pic_info);
		params.put("category", "test");
		params.put("market_price", "12");
		params.put("settled_price", "10");
		params.put("discount_price", "11");
		params.put("service_fee", "100");
		params.put("stock_qty", "100");
		params.put("min_buy_qty", "10");
		params.put("max_buy_qty", "50");
		try {
			String result = requestUrl("http://192.168.16.63:8083/supplierCentre/portal/presupplier", "presupplier.addPreSupplier", params);
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static String requestUrl(String url, String service, Map<String, String> params) throws Exception{
		Map<String, String> reqParams = new HashMap<String, String>();
		reqParams.put("service", service);
		reqParams.put("token", "55075e58476f47b0a25a58277dc41f24");
		reqParams.put("params", JSONObject.fromObject(params).toString());
		String result = HttpClientUtil.post(url, reqParams);
		return result;
	}

}
