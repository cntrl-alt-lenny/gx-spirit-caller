/* data_020fe55c (28 bytes, 4-aligned): retyped from opaque bytes to a
 * partial-evidence struct as part of cm-data-inference-11, resolving a
 * wave-5 WEAK decline under this campaign's newer partial-struct
 * standard (waves 8-10). Offset 0 is a relocated `char *name` field
 * (own static initializer is a link-time pointer to the next symbol),
 * written by the already-matched func_0204067c.c and read by 2 more
 * consumers (func_0204014c.s, func_020421d8.s), consumed via a
 * strcmp-equivalent helper. Offsets 0xc/0x10/0x14 are write-only
 * (func_0204014c.s) with unproven semantics -- kept typed as plain
 * `int` per this symbol's own established precedent (data_02102120.c's
 * unk_0x0c/unk_0x12) rather than named fields. Offsets 4-0xb and
 * 0x18-0x1b have zero relocations and zero consumers -- honest opaque
 * gaps. USA/JPN have no symbol at this address at all; moot for build
 * safety since this unprefixed src/main/ file is EUR-only (same
 * tools/configure.py exclusion rule used for data_02102120, wave 10).
 * func_0204067c.c's existing `extern char data_020fe55c[];` +
 * `*(void **)data_020fe55c = p;` needs no change -- extern
 * declarations aren't type-checked across TUs on this toolchain, and
 * the compiled store to offset 0 is identical either way.
 */

typedef struct {
    char *name;
    unsigned char gap_0x04[8];
    int unk_0x0c;
    int unk_0x10;
    int unk_0x14;
    unsigned char gap_0x18[4];
} Data020fe55cSlot;

Data020fe55cSlot data_020fe55c = {
    (char *)0x020fe578,
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00 },
    0,
    0,
    0,
    { 0x20, 0x4e, 0x00, 0x00 },
};
