package org.biblioService.business.impl.manager;

import javax.inject.Inject;
import javax.inject.Named;
import javax.validation.Validation;
import javax.validation.Validator;

import org.biblioService.consumer.contrat.dao.DaoFactory;
import org.springframework.transaction.PlatformTransactionManager;

/**
 * 
 * Superclasse des Manager permettant la gestion du transactionManager de
 * Spring, du daoFactory et du Validator pour tous les Manager
 * 
 * @author Oltenos
 *
 */
public abstract class AbstractManagerImpl {

	/**
	 * gestionnaire (Manager) de transaction (Spring)
	 */
	@Inject
	@Named("txManager")
	private PlatformTransactionManager platformTransactionManager;

	protected PlatformTransactionManager getPlatformTransactionManager() {
		return platformTransactionManager;
	}

	/**
	 * Injection du DaoFactory pour tous les Manager
	 */
	@Inject
	private DaoFactory daoFactory;

	protected DaoFactory getDaoFactory() {
		return daoFactory;
	}

	/**
	 * Récupération du Validator pour tous les Manager
	 */
	private Validator validator = Validation.buildDefaultValidatorFactory().getValidator();

	protected Validator getValidator() {
		return validator;
	}
}
