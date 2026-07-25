/* func_02085664: one of a 3-entry dispatch table (data_021021c4 — with
 * func_02085d24 and func_0208610c; see their dossiers in
 * docs/research/dossiers/ for the shared (obj, src, arg, mask) family
 * signature). Simplest variant: guarded by mask bit 0x4, either sets a
 * status bit on obj or field-by-field copies a 3-word (x/y/z-shaped)
 * block from src into obj+0x4..0xc, then unconditionally ORs 0x18 into
 * obj's flags word.
 *
 * Matches on the mwcc 1.2/sp2p3 tier (.legacy.c), not the default
 * 2.0/sp1p5 — the codegen lever tested here is field-by-field
 * assignment for the copy (dst->x = src->x; ...) rather than a single
 * aggregate struct assignment, which would fold into ldmia/stmia (see
 * src/main/func_020822a0.c) and not match the individual ldr/str
 * sequence the original disassembly shows.
 */
typedef unsigned char u8;
typedef unsigned int u32;

void func_02085664(u32 *obj, u32 *src, u8 *arg, int mask) {
    if (mask & 4) {
        obj[0] |= 1;
    } else {
        obj[1] = src[0];
        obj[2] = src[1];
        obj[3] = src[2];
    }
    obj[0] |= 0x18;
}
