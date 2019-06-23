import com.zjgsu.face.*;
public class runme {
        static {
                System.loadLibrary("detect");
        }

        public static void main(String argv[]) {
                npddetect npd = new npddetect();
                npd.load("./model/result.bin");
                npd.loadAlignModel("./model/68.model");
                npd.detect("./5b.jpg");
                System.out.println("hello world");
        }
}
