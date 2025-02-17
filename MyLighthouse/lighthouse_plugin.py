from lighthouse.util.log import logging_started, start_logging
from lighthouse.util.disassembler import disassembler
import os
import wingdbstub
if "wing.exe" in os.popen('tasklist /FI "IMAGENAME eq wing.exe"').read():
    wingdbstub.Ensure()
if not logging_started():
    logger = start_logging()

import sys
sys.setrecursionlimit(1000000)
#------------------------------------------------------------------------------
# Disassembler Agnonstic Plugin Loader
#------------------------------------------------------------------------------

logger.debug("Resolving disassembler platform for plugin...")

if disassembler.headless:
    logger.info("Disassembler '%s' is running headlessly" % disassembler.NAME)
    logger.info(" - Lighthouse is not supported in headless modes (yet!)")

elif disassembler.NAME == "IDA":
    logger.info("Selecting IDA loader...")
    from lighthouse.ida_loader import *

elif disassembler.NAME == "BINJA":
    logger.info("Selecting Binary Ninja loader...")
    from lighthouse.binja_loader import *

else:
    raise NotImplementedError("DISASSEMBLER-SPECIFIC SHIM MISSING")

