/* data_ov000_021b5614 (8 bytes, 4-aligned): same x0/y0 shape as sibling
 * data_ov000_021b5600, structurally analogous but with only one trailing
 * word instead of three.
 * Consumer: func_ov000_021ad8dc (src/overlay000/func_ov000_021ad8dc.s:194
 * _LIT13, relocs.txt ov000:264 from:0x021adb4c kind:load to:0x021b5614),
 * the "clone pair" sibling of func_ov000_021ad660 -- loop body lines
 * 157-158 (r8 pinned to 0): `ldrh r1,[r6,r3]` (+0x0=224), `ldrh
 * r2,[r0,#0x2]` (+0x2=168), forwarded to func_ov000_021ac478(ctx,224,168,
 * <w>,<h>) at line 161, same call shape as data_ov000_021b5600.
 * Secondary cross-module evidence (weaker/opaque): config/eur/arm9/
 * relocs.txt:19443 `from:0x020c4454 kind:load to:0x021b5614
 * module:overlays(0,6,7,9,14,21)` -- a pointer inside main's raw,
 * not-yet-typed data blob src/main/data/data_020c4204.s (offset 0x250),
 * part of an overlay-swap-group table shared by six overlays that all
 * load at this address; not counted as "the" reader since it's a
 * data-to-data pointer, not code dereferencing this candidate.
 * Word at +0x4 (0x200) is not dereferenced by the ov000-internal reader,
 * and no reloc targets 0x021b5618 -- kept as a plain int.
 */
typedef struct {
    unsigned short x0;  /* +0x0, func_ov000_021ac478 arg1 (224) */
    unsigned short y0;  /* +0x2, func_ov000_021ac478 arg2 (168) */
    int f04;             /* not dereferenced by the one known reader */
} data_ov000_021b5614_t;

const data_ov000_021b5614_t data_ov000_021b5614 = { 224, 168, 0x200 };
