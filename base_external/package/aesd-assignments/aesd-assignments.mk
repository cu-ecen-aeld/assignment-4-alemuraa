##############################################################
# AESD-ASSIGNMENTS Buildroot Package
##############################################################

# TODO: Inserisci qui l'hash del commit dell'Assignment 3
AESD_ASSIGNMENTS_VERSION = 607f618bbf613db044e9a823c898c1a3d3609e7f

# IMPORTANTE:
# Usa l'URL del repository SSH (non HTTPS), necessario per il sistema di build/test automatico.
# Il sito deve iniziare con: git@github.com:
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-alemuraa.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

# Comandi di build: compila i componenti finder-app e server
define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

# Comandi di installazione nel target filesystem
# TODO: Assicurati che gli script/utilità writer, finder e finder-test siano inclusi
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	# Installa il demone aesdsocket e lo script init
	$(INSTALL) -m 0775 $(@D)/server/aesdsocket $(TARGET_DIR)/bin
	$(INSTALL) -m 0775 $(@D)/server/aesdsocket-start-stop.sh $(TARGET_DIR)/etc/init.d/S99aesdsocket

	# Installa tutti i file della finder-app
	$(INSTALL) -d 0775 $(@D)/finder-app/ $(TARGET_DIR)/bin
	$(INSTALL) -m 0775 $(@D)/finder-app/* $(TARGET_DIR)/bin

	# Installa i file di configurazione finder-app
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/

	# Installa gli script di test dell'assignment 4
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
endef

# Registra il pacchetto come generico
$(eval $(generic-package))

