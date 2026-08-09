/* data_ov011_021d3900 (224 bytes = 56 x 4-byte slots, 4-aligned): flat
 * array of `void *`, 33 real pointers + 23 NULL slots. Word-granularity
 * only -- no wider-stride/record evidence was found (see below), so
 * this ships flat rather than forcing a record shape.
 *
 * Every non-zero word cross-checked against relocs.txt (33 matches,
 * relocs.txt:1360-1392, `from:` addresses exactly `0x021d3900 + 4*idx`
 * for each non-NULL idx below, `kind:load`, `module:overlay(11)`); the
 * 23 zero words have NO relocation at their address -- confirmed real
 * NULL, not an unrecovered pointer. All 33 targets are already-named,
 * not-yet-carved `data_ov011_0*` symbols (verified individually against
 * delinks.txt -- none has its own TU yet). Most (e.g. 0x3664, 0x3678,
 * 0x36f0...0x37e0) are members of the same 0x14-stride "actor/view
 * slot" table family that data_ov011_021d2fd4 also points into; a
 * second group (0x39e0, 0x3a30, 0x3a6c, 0x3a94, 0x3ae4, 0x3af8, 0x3bf8,
 * 0x3f20-0x3f90) falls outside that tight stride cluster and is not
 * further explained by evidence gathered here -- flagged honestly
 * rather than guessed.
 *
 * Section: config/eur/arm9/overlays/ov011/delinks.txt's module header
 * confirms `.data start:0x021d3660 end:0x021d4000 kind:data align:32`
 * covers this address -> NOT `const`.
 *
 * `&symbol` (not raw literal casts) is correct and safe here -- unlike
 * the `.rodata` case data_ov011_021d2fd4.c (see that file's header for
 * why raw literals are required there), this object's ground truth is
 * already `.data`, so the relocation `&symbol` forces is not a section
 * conflict. Matches the established idiom of this exact .data pointer-
 * table sub-cluster's immediate neighbors, data_ov011_021d38a8.c and
 * data_ov011_021d38f0.c (both `extern char X; ... &X`, `void *arr[N]`,
 * no `const`).
 *
 * Consumer: src/overlay011/func_ov011_021cd65c.c (already shipped,
 * matched): `func_ov011_021d2d6c(32, 32, *(int *)(data_ov011_021d3900 +
 * (((unsigned int)(*(int *)(s + 0x268) << 23) >> 28) << 2)))` -- a 4-bit
 * nibble extracted from bits 5-8 of `s[0x268]` selects a word-index 0-15
 * (idx<<2 = byte offset), i.e. demonstrates `((void**)base)[idx]`
 * addressing for indices 0-15. relocs.txt:497 (`from:0x021cd6cc
 * kind:load to:0x021d3900`) is the ONLY base-pointer load found for
 * this symbol; the demonstrated index range (0-15) covers only the
 * first 16 of 56 slots -- the object's full 224-byte extent is
 * established independently by the delinks.txt gap boundary (next
 * symbol data_ov011_021d39e0 starts exactly at +0xE0) and by every
 * later non-zero word's own relocs.txt entry, not by this one
 * consumer's index range. No second consumer for indices 16-55 was
 * found in src/overlay011/ or relocs.txt; noted honestly rather than
 * invented.
 */

extern char data_ov011_021d3f3c;
extern char data_ov011_021d3f58;
extern char data_ov011_021d3f74;
extern char data_ov011_021d3f90;
extern char data_ov011_021d3f20;
extern char data_ov011_021d3a6c;
extern char data_ov011_021d36f0;
extern char data_ov011_021d37a4;
extern char data_ov011_021d36dc;
extern char data_ov011_021d3704;
extern char data_ov011_021d3718;
extern char data_ov011_021d3a30;
extern char data_ov011_021d3a94;
extern char data_ov011_021d3768;
extern char data_ov011_021d37e0;
extern char data_ov011_021d36b4;
extern char data_ov011_021d3740;
extern char data_ov011_021d372c;
extern char data_ov011_021d36c8;
extern char data_ov011_021d39e0;
extern char data_ov011_021d3ae4;
extern char data_ov011_021d377c;
extern char data_ov011_021d3af8;
extern char data_ov011_021d3790;
extern char data_ov011_021d37b8;
extern char data_ov011_021d3754;
extern char data_ov011_021d36a0;
extern char data_ov011_021d3664;
extern char data_ov011_021d37cc;
extern char data_ov011_021d3bf8;
extern char data_ov011_021d3678;
extern char data_ov011_021d3894;
extern char data_ov011_021d368c;

void *data_ov011_021d3900[56] = {
    0,                            /* [0] */
    &data_ov011_021d3f3c,        /* [1] */
    &data_ov011_021d3f58,        /* [2] */
    &data_ov011_021d3f74,        /* [3] */
    &data_ov011_021d3f90,        /* [4] */
    &data_ov011_021d3f20,        /* [5] */
    &data_ov011_021d3a6c,        /* [6] */
    &data_ov011_021d36f0,        /* [7] */
    &data_ov011_021d37a4,        /* [8] */
    &data_ov011_021d36dc,        /* [9] */
    0, 0, 0, 0, 0, 0,             /* [10]-[15] */
    &data_ov011_021d3704,        /* [16] */
    &data_ov011_021d3718,        /* [17] */
    &data_ov011_021d3a30,        /* [18] */
    &data_ov011_021d3a94,        /* [19] */
    &data_ov011_021d3768,        /* [20] */
    &data_ov011_021d37e0,        /* [21] */
    &data_ov011_021d36b4,        /* [22] */
    0, 0, 0,                      /* [23]-[25] */
    &data_ov011_021d3740,        /* [26] */
    &data_ov011_021d372c,        /* [27] */
    &data_ov011_021d36c8,        /* [28] */
    &data_ov011_021d39e0,        /* [29] */
    &data_ov011_021d3ae4,        /* [30] */
    &data_ov011_021d377c,        /* [31] */
    &data_ov011_021d3af8,        /* [32] */
    &data_ov011_021d3790,        /* [33] */
    &data_ov011_021d37b8,        /* [34] */
    &data_ov011_021d3754,        /* [35] */
    &data_ov011_021d36a0,        /* [36] */
    &data_ov011_021d3664,        /* [37] */
    &data_ov011_021d37cc,        /* [38] */
    &data_ov011_021d3bf8,        /* [39] */
    0, 0, 0, 0, 0, 0,             /* [40]-[45] */
    &data_ov011_021d3678,        /* [46] */
    &data_ov011_021d3894,        /* [47] */
    &data_ov011_021d368c,        /* [48] */
    0, 0, 0, 0, 0, 0, 0,          /* [49]-[55] */
};
