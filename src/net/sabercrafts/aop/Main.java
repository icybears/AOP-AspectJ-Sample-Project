package net.sabercrafts.aop;

public class Main {

	public static void main(String[] args) {
		
		Client client = new Client();
		client.setNom("John");
		
		client.setCp(new Compte());
		
		Compte compte = client.getCp();
		
		compte.setSolde(2000);
		
		client.retirer(200000);
		
		client.verser(400);
		

	}

}
