/* CAMPAIGN-PREP candidate for func_02007f58 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     straight-line init: calls + halfword/word field stores + masked-field-first orr
 *   risk:       Many bases/offsets guessed; scheduling of interleaved literal loads; strh sharing r2=1 across two stores.
 *   confidence: med
 */
/* func_02007f58: top-level system init.
 *   func_020945f4(data_02104f4c, 0, 0x1b0c)
 *   func_02018be8()
 *   data_0210593c->0x62 = 1 ; data_0210593c->0x68 = 1   (u16, share const 1)
 *   data_02104f3c->0xa70 = 500
 *   r = func_02007e8c(); field0x14 = (field0x14 & ~7) | (r & 7)
 *   func_02007278()
 *   data_02105f3c->0x858 = -1
 *   func_02018... teardown chain, func_0200a26c(2/1/0), func_02007f38()
 *
 * orr operand order is (field & ~7) | (r & 7) -> masked field FIRST so its
 * register is the orr destination (matches `orr r0,r2,r0`).
 */
extern char data_02104f4c[];
extern char data_0210593c[];
extern char data_02104f3c[];
extern char data_02105f3c[];
extern void func_020945f4(void *p, int a, int n);
extern void func_02018be8(void);
extern int  func_02007e8c(void);
extern void func_02007278(void);
extern void func_020138b8(void);
extern void func_0200a454(void);
extern void func_0200a26c(int a);
extern void func_02007f38(void);

void func_02007f58(void) {
    int r;

    func_020945f4(data_02104f4c, 0, 0x1b0c);
    func_02018be8();

    *(unsigned short *)(data_0210593c + 0x62) = 1;
    *(unsigned short *)(data_0210593c + 0x68) = 1;
    *(int *)(data_02104f3c + 0xa70) = 0x1f4;

    r = func_02007e8c();
    *(int *)(data_02104f3c + 0x14) =
        (*(int *)(data_02104f3c + 0x14) & ~7) | (r & 7);

    func_02007278();
    *(int *)(data_02105f3c + 0x858) = -1;

    func_020138b8();
    func_0200a454();
    func_0200a26c(2);
    func_0200a26c(1);
    func_0200a26c(0);
    func_02007f38();
}
