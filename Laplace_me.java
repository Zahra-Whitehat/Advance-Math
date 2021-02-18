import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.Scanner;

public class Laplace{
	public static void main (String[] args) {
	   

	//Creation of matrix
	Scanner s = new Scanner(System.in);
        System.out.print("Enter no. of rows and columns as a single number:");
        int n = s.nextInt();

        //Filling the matrix
        float a[][] = new float[n][n];
	Scanner s2 = new Scanner(System.in);
        System.out.println("Enter all the elements:");

		for(int i = 0; i < n; i++){
        		for(int j = 0; j < n; j++){
           			a[i][j] = s2.nextFloat();
			}
      		}
	float  d = det(a[][],n);

	}
	// Creation of the minor of matrix
	public void build(int b[][],int a[][],int i,int n)
		{
		int h = 0;
		int k = 0;
		for(int l = 1; l < n; l++){
		    for(int j = 0; j < n; j++){
			if(j==i)
			continue;
		     	b[h][k] = a[l][j];
			k++;
			if(k == n-1){
			h++;
			k = 0;
		      	}
		 
		    }
		}
	}	
	// Calculation the determinant
	public float det(int a[][],int n){
	    	float sum = 0;
		int b[][];
    		if(n==2){
	      		sum = a[0][0]*a[1][1]-a[0][1]*a[1][0];
	      		return sum;
	 	}
  		else{
	 		for(int i = 0; i < n; i++){
			build(b,a,i,n);
			sum += a[0][i]*(Math.pow(-1,i))*det(b,(n-1));
		 	}
	   	}
 		return sum;
		}



}

