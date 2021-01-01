package net.sabercrafts.aop;

import org.apache.log4j.Logger;

public aspect ClientAspect {

	private static Logger logger = Logger.getLogger("fileLog");

	private static long timer;

	pointcut retirerArgent(): call(* ma.ensa.aop.Client.retirer(*));

	Object around() : retirerArgent() {
		
		logger.info("---- Operation de Retrait");
		timer = System.currentTimeMillis();
		Object o = null;
		
		double mt = (Double) thisJoinPoint.getArgs()[0];
		Client client = (Client) thisJoinPoint.getTarget();
		
		logger.info("Verification du solde");
		
		if (client.getCp().getSolde() < mt) {
			logger.info("Echec. Solde insuffisant.");
		} else {
			logger.info("Solde disponible.");
			o = proceed();
			
			logger.info("Le client " + client.getNom() + " a retiré une somme d'argent de "+mt+"dh");
			logger.info("Le nouveau solde est " + client.getCp().getSolde());
			logger.info(" Cette operation a pris " + (System.currentTimeMillis() - timer) + "ms");
		}

		logger.info("---- Fin Operation");

		return o;
	}

	pointcut verserArgent(): call(* ma.ensa.aop.Client.verser(*));

	before() : verserArgent() {

		logger.info("---- Operation de Versement ");
		timer = System.currentTimeMillis();
	}

	after() : verserArgent() {
		Client client = (Client) thisJoinPoint.getTarget();
		double mt = (Double) thisJoinPoint.getArgs()[0];
		logger.info("Le client " + client.getNom() + " a versé une somme de "+mt+"dh");
		logger.info("Le nouveau solde est " + client.getCp().getSolde());
		logger.info(" Cette operation a pris " + (System.currentTimeMillis() - timer) + "ms");
		logger.info("---- Fin Operation");
	}

//	Object around() : verserArgent() {
//		logger.info("debut du versement");
//		timer = System.currentTimeMillis();
//		Object o = proceed();
//		Client client = (Client) thisJoinPoint.getTarget();
//		logger.info("Le client " + client.getNom() + " a verser une somme d'argent");
//		logger.info("Le nouveau solde est " + client.getCp().getSolde());
//		logger.info(" Cette operation a pris " + (System.currentTimeMillis() - timer) + "ms");
//
//		return o;
//	}
	
}
