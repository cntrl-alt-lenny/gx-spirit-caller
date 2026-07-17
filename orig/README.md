# orig/

Drop your own clean dump of Yu-Gi-Oh! GX Spirit Caller here:

    orig/baserom_<version>.nds

The supported regions and game codes are `eur` / AYXP, `usa` / AYXE, and
`jpn` / AYXJ.

`tools/configure.py` verifies its SHA-1 before generating `build.ninja`. A wrong
or modified dump fails loudly — do not disable the check.

ROMs are `.gitignore`d and must never be committed.
