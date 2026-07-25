/* func_ov001_021ca064 — C-34 candidate (docs/research/codegen-walls.md).
 * Orig pool has two distinct .word data_ov001_021ca340 slots: slot 1 is
 * read once for the low byte (b0, a dispatch selector); slot 2 is loaded
 * separately and kept alive (callee-saved r4) for the rest of the
 * function -- the b1 reload, the b2 reads, and both bitfield writes.
 *
 * A plain typed-struct member split by field (b0 vs b1/b2) does NOT by
 * itself force two independent pool words -- verified empirically on the
 * func_02023fd0/func_0202707c siblings in this batch: mwcc freely shares
 * one pool-loaded base register across different immediate-offset field
 * accesses on the same struct, and even where the compiler emits two
 * separate `ldr` instructions, mwasmarm's literal-pool dedup can still
 * collapse them onto one .word since both want the identical address
 * value. What actually forces two independent pool words is the existing
 * C-27 alias recipe: a second extern name at the identical address
 * (data_ov001_021ca340_alias, added to symbols.txt/BSS here) that neither
 * the compiler nor the assembler can prove aliases the first.
 *
 * b1's dispatch ranges use a divide-by-60 (magic constant 0x88888889,
 * shift 5) to compute an angle/offset argument for func_ov000_021ab4cc.
 *
 * Ported from the matched EUR source (func_ov001_021ca144.c) via
 * port_to_region.py; port_to_region.py's address-keyed data-symbol map
 * can't distinguish a base-vs-alias reference at the SAME address (it
 * returns whichever name symbols.txt lists last for that address), so
 * both extern decls collapsed to `_alias` in the raw auto-port -- hand-
 * corrected back to the EUR source's exact base/alias split below (base
 * for the single direct `.b0` field read, alias for the address-of that
 * seeds `ref` and every other access), matching cm-crossregion-mop's
 * bss-alias fix pattern (see func_ov008_021ac1cc's commit).
 */

typedef struct {
    unsigned int b0 : 8;   /* +0x0 bits 0-7:   dispatch selector */
    unsigned int b1 : 8;   /* +0x0 bits 8-15:  incrementing counter/timer */
    unsigned int b2 : 8;   /* +0x0 bits 16-23: secondary counter */
    unsigned int b3 : 8;   /* +0x0 bits 24-31: unused by this function */
} data_ov001_021ca340_t;

extern data_ov001_021ca340_t data_ov001_021ca340;
extern data_ov001_021ca340_t data_ov001_021ca340_alias;  /* SAME address — see symbols.txt */

extern void func_02005c84(int a);
extern void func_02005e04(int a);
extern void func_ov000_021ab440(int idx, int val);
extern void func_ov000_021ab4cc(int idx, int val);
extern int func_ov000_021ab5ec(void);
extern void func_ov000_021ab818(void);
extern void func_ov001_021c9e44(int val);

int func_ov001_021ca064(void) {
    data_ov001_021ca340_t *ref = &data_ov001_021ca340_alias;
    unsigned int b0 = data_ov001_021ca340.b0;
    int flag = 0;

    switch (b0) {
    case 0: {
        int b1 = ref->b1;

        if (b1 <= 0x3c) {
            int v;
            func_ov000_021ab440(0, 1);
            func_ov000_021ab440(1, 1);
            v = (int)(b1 << 4) / 60 - 0x10;
            func_ov000_021ab4cc(0, v);
            func_ov000_021ab4cc(1, v);
        } else if (b1 < 0xb4) {
            /* nothing extra */
        } else if (b1 <= 0xf0) {
            int v;
            func_ov000_021ab440(0, 1);
            func_ov000_021ab440(1, 1);
            v = (-(int)((b1 + 0x3c) << 4)) / 60;
            func_ov000_021ab4cc(0, v);
            func_ov000_021ab4cc(1, v);
        } else {
            int b2 = ref->b2;
            if (b2 + 1 >= 2) {
                flag = 1;
            } else {
                func_ov001_021c9e44(b2 + 1);
                ref->b2 = (unsigned char)(b2 + 1);
                b1 = flag;
            }
        }
        ref->b1 = (unsigned char)(b1 + 1);
        break;
    }
    case 0xa:
        if (func_ov000_021ab5ec() != 0) flag = 1;
        break;
    }

    func_02005e04(1);
    func_02005e04(2);
    func_02005c84(1);
    func_02005c84(2);
    func_ov000_021ab818();
    return flag;
}
