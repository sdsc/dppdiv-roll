ifndef ROLLCOMPILER
  ROLLCOMPILER = gnu
endif
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))

ifndef ROLLMPI
  ROLLMPI = openmpi
endif
MPINAME := $(firstword $(subst /, ,$(ROLLMPI)))

NAME           = dppdiv-pll_$(COMPILERNAME)_$(MPINAME)
VERSION        = 1.0
RELEASE        = 2
PKGROOT        = /opt/dppdiv

SRC_SUBDIR     = dppdiv

SOURCE_NAME    = dppdiv-pll
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)_$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
