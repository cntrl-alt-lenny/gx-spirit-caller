/* Ov006AudioBank -- shared audio-channel "bank" object, cm-restock-carve-1
 * fast-follow to the 6-member family shipped in cm-bss-convert-9 (flagged
 * there as "same size, same idiom per raw .s/draft evidence, not
 * independently re-verified" -- now verified to full standard). Confirmed
 * via func_ov006_021b4f68.s (still ship-as-.s, GLOBAL_ASM endgame): `ldr
 * r0, =data_ov006_0224f344; bl func_0202adf8` immediately followed by `bl
 * func_0202ae1c` -- the exact same two-call signature proven for all 6
 * already-shipped members (func_0202adf8 caches the object's own address
 * into the "current bank" global + Fill32-zeroes all 60 bytes;
 * func_0202ae1c dereferences that cache). Verified directly against raw
 * disassembly since the caller itself has no C match yet. See
 * data_ov006_021cf174.c for the full field-provenance writeup (identical
 * struct, first-shipped member of this family). */
typedef struct {
    int   chan;        /* +0x00: written only in func_0202ae1c's chan>=0 path */
    void *h04, *h08, *h0c, *h10, *h14; /* +0x04..+0x14 */
    void *h18, *h1c;   /* +0x18, +0x1c */
    char  _unk20[0xc]; /* +0x20..+0x2b: unconfirmed, true gap */
    void *h2c, *h30, *h34, *h38; /* +0x2c..+0x38 */
} Ov006AudioBank;  /* 0x3c (60) bytes */

Ov006AudioBank data_ov006_0224f344;
