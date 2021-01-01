package net.sabercrafts.aop;

public class Main {

	public static void main(String[] args) {
		
		Client client = new Client();
		client.setNom("John");
		
		client.setCp(new Compte());
		
		Compte compte = client.getCp();
		
		compte.setSolde(2000);

		
		// Operation retrait avec solde insuffisant, echec
		client.retirer(200000);
		
		// Operation de retrait avec solde suffisant
		client.retirer(600);
		
		// Operation de versement
		client.verser(400);
		

	}

}
