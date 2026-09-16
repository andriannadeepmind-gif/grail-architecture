# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
"""Shared test bootstrap: locate tools/ and the package root without installing anything."""
import pathlib
import sys

sys.dont_write_bytecode = True
TOOLS = pathlib.Path(__file__).resolve().parents[2]
PKG = TOOLS.parent
if str(TOOLS) not in sys.path:
    sys.path.insert(0, str(TOOLS))
