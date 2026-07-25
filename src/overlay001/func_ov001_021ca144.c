/* func_ov001_021ca144 — C-34 candidate (docs/research/codegen-walls.md).
 * Orig pool has two distinct .word data_ov001_021ca420 slots: slot 1 is
 * read once for the low byte (b0, a dispatch selector); slot 2 is loaded
 * separately and kept alive (callee-saved r4) for the rest of the
 * function -- the b1 reload, the b2 reads, and both bitfield writes.
 *
 * A plain typed-struct member split by field (b0 vs b1/b2) does NOT by
 * itself force two independent pool words -- verified empirically on the
 * func_02024024/func_020270d0 siblings in this batch: mwcc freely shares
 * one pool-loaded base register across different immediate-offset field
 * accesses on the same struct, and even where the compiler emits two
 * separate `ldr` instructions, mwasmarm's literal-pool dedup can still
 * collapse them onto one .word since both want the identical address
 * value. What actually forces two independent pool words is the existing
 * C-27 alias recipe: a second extern name at the identical address
 * (data_ov001_021ca420_alias, added to symbols.txt/BSS here, mirroring
 * the pre-existing data_0219a8e4_alias / data_0219a934_alias pattern used
 * for this exact shape elsewhere) that neither the compiler nor the
 * assembler can prove aliases the first.
 *
 * b1's dispatch ranges use a divide-by-60 (magic constant 0x88888889,
 * shift 5 -- verified against docs/research/*, matches the standard
 * signed-division-by-60 idiom) to compute an angle/offset argument for
 * func_ov000_021ab5ac. Callees' real signatures cross-checked against
 * already-matched siblings: func_ov000_021ab520.c (int,int),
 * func_ov000_021ab6cc.c (void)->int, func_ov001_021ca074.c
 * (func_ov001_021c9f24 takes int), Ov013_SetPage.c (func_ov000_021ab8f8
 * takes void); func_ov000_021ab5ac's own .s (still unmatched) confirms
 * (int idx, int val) writing a bitfield at row[idx]+0x8.
 *
 * SHIPPED — 100% (mod. a harmless pre-link relocation-symbol-name diff
 * against the alias, verified byte-identical via objdump -dr; both
 * `data_ov001_021ca420` and `_alias` resolve to the same linked address).
 * Beyond the alias/pool-dup fix, three more levers were needed to close
 * the remaining ~99%:
 *   1. `switch (b0) { case 0: ...; case 0xa: ...; }` instead of
 *      `if (b0==0) {...} else if (b0==0xa) {...}` -- the if/else-if form
 *      compiles to an inverted early branch + fallthrough; orig's shape
 *      is the switch's explicit beq/cmp/beq/b 3-way dispatch.
 *   2. Statement order inside each b1-range branch: orig computes the
 *      div-by-60 value AFTER the two `func_ov000_021ab520` calls, not
 *      before (both are legal orders, only one matches byte-for-byte).
 *   3. `b1`/`b2` locals as plain `int`, not `unsigned int` -- the range
 *      tests (`<=`, `<`) need SIGNED branch opcodes (bgt/blt) to match;
 *      unsigned locals emit bhi/blo instead. And the two bitfield writes
 *      need an explicit `(unsigned char)` narrowing cast (not `&0xff`,
 *      which mwcc proves redundant against the bic/orr write sequence and
 *      elides) to reproduce an extra, otherwise-eliminated `and #0xff`
 *      the original has ahead of the bitfield pack.
 */

typedef struct {
    unsigned int b0 : 8;   /* +0x0 bits 0-7:   dispatch selector */
    unsigned int b1 : 8;   /* +0x0 bits 8-15:  incrementing counter/timer */
    unsigned int b2 : 8;   /* +0x0 bits 16-23: secondary counter */
    unsigned int b3 : 8;   /* +0x0 bits 24-31: unused by this function */
} data_ov001_021ca420_t;

extern data_ov001_021ca420_t data_ov001_021ca420;
extern data_ov001_021ca420_t data_ov001_021ca420_alias;  /* SAME address — see symbols.txt */

extern void func_02005ca0(int a);
extern void func_02005e20(int a);
extern void func_ov000_021ab520(int idx, int val);
extern void func_ov000_021ab5ac(int idx, int val);
extern int func_ov000_021ab6cc(void);
extern void func_ov000_021ab8f8(void);
extern void func_ov001_021c9f24(int val);

int func_ov001_021ca144(void) {
    data_ov001_021ca420_t *ref = &data_ov001_021ca420_alias;
    unsigned int b0 = data_ov001_021ca420.b0;
    int flag = 0;

    switch (b0) {
    case 0: {
        int b1 = ref->b1;

        if (b1 <= 0x3c) {
            int v;
            func_ov000_021ab520(0, 1);
            func_ov000_021ab520(1, 1);
            v = (int)(b1 << 4) / 60 - 0x10;
            func_ov000_021ab5ac(0, v);
            func_ov000_021ab5ac(1, v);
        } else if (b1 < 0xb4) {
            /* nothing extra */
        } else if (b1 <= 0xf0) {
            int v;
            func_ov000_021ab520(0, 1);
            func_ov000_021ab520(1, 1);
            v = (-(int)((b1 + 0x3c) << 4)) / 60;
            func_ov000_021ab5ac(0, v);
            func_ov000_021ab5ac(1, v);
        } else {
            int b2 = ref->b2;
            if (b2 + 1 >= 2) {
                flag = 1;
            } else {
                func_ov001_021c9f24(b2 + 1);
                ref->b2 = (unsigned char)(b2 + 1);
                b1 = flag;
            }
        }
        ref->b1 = (unsigned char)(b1 + 1);
        break;
    }
    case 0xa:
        if (func_ov000_021ab6cc() != 0) flag = 1;
        break;
    }

    func_02005e20(1);
    func_02005e20(2);
    func_02005ca0(1);
    func_02005ca0(2);
    func_ov000_021ab8f8();
    return flag;
}
