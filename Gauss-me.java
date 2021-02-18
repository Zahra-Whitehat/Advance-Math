import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.Scanner;

public class Gauss{
	public static void main (String[] args) {
	   

	int sign = 1;
	int counter = 0;

	//sakhte matris 
	Scanner s = new Scanner(System.in);
        System.out.print("Enter no. of rs and cs as a single number:");
        int n = s.nextInt();

        //por kardane matris
        float a[][] = new float[n][n];
	Scanner s2 = new Scanner(System.in);
        System.out.println("Enter all the e:");


	while(counter != n){

		for(int i = 0; i < n; i++){
        		for(int j = 0; j < n; j++){
           			a[i][j] = s2.nextFloat();
			}
      		}
		counter ++;
		break;
	}
        //step1 : yaftane satri ke derayere avalash gheire sefr ast
        int k=0;
        int temp = -1;
        while (k<n){
        	if (a[0][0] == 0){
        		if(a[k][0] != 0)
        			temp = k;
        			break;

        	}
        }
        

         if (temp == -1){
         	System.out.print("determinant = 0");
         }
         // jabejaii satre aval ba satre yafte shode
         else{
        
		sign *= -1;
         	for (int l = 0; l < n; l++){
         		float temp2 = a[k][l];
         		 a[k][l] = a[0][l];
         		 a[0][l] = temp2;
			
         	}
	}

	// sefr kardane derayehaye avale hameye satrha ba estefade az derayeye avale satre aval
	for(int m = 1; m < n; m++){
		for(int r = 0; r < n; r++){
			if (a[m][0] == 0)
				r++;
			else 
				a[m][r] += -(((a[m][0])/(a[0][0]))*(a[0][r]));


		}
		
	}
	//kuchek kardane matris va baste laplas ruye an ta residan be size 1*1

	/*float r1[][], r2[][];
	if(r1.length != r2.length){
		return false;	
	}
	int p;
	double f = r2[p] / r1[p];
	for(int i = p; i < r1.length; i++){
		r2[i] -= f * r1[i];
	}
	*/

	/*public void Reduce() {
        for (int r = 0, l = 0; r < rs && l < cs; ++r, ++l) {
            int i = r;
            while (e[i][l] == 0) {
                if (++i == rs) {
                    i = r;
                    if (++l == cs)
                        return;
                }
            }
            swaprs(i, r);
            if (e[r][l] != 0) {
                double f = e[r][l];
                for (int c = 0; c < cs; ++c)
                    e[r][c] /= f;
            }
            for (int j = 0; j < rs; ++j) {
                if (j == r)
                    continue;
                double f = e[j][l];
                for (int c = 0; c < cs; ++c)
                    e[j][c] -= f * e[r][c];
            }
        }
    }

	private void swapRows(int i, int j) {
        double[] tmp = elements[i];
        elements[i] = elements[j];
        elements[j] = tmp;
    }
	*/
	}



}

