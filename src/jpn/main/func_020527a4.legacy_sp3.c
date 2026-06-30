/* CAMPAIGN-PREP candidate for func_020527a4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     early-return guard + linear field stores in store-order; sp3
 *   risk:       fields 0x4/0x8 word, 0x1d u8=1, 0x10/0x18 word=0; func_020522c0(a0)==2 guard; sp3 routing; r4=p
 *   confidence: med
 */
/* func_020527a4 -> src/main/func_020527a4.legacy_sp3.c (mwcc 1.2/sp3: push{r4-r7,lr}+sub sp,#4+pop pc) */
typedef struct {
    char _pad04[0x4];
    int           f04;   /* +0x4 */
    int           f08;   /* +0x8 */
    char _pad10[0x10 - 0xc];
    int           f10;   /* +0x10 */
    char _pad18[0x18 - 0x14];
    int           f18;   /* +0x18 */
    char _pad1d[0x1d - 0x1c];
    unsigned char f1d;   /* +0x1d */
} Obj;
extern Obj  *func_020522f8(void);
extern int   func_020522c0(int);

int func_020527a4(int a, int b, int c) {
    Obj *p = func_020522f8();
    if (func_020522c0(a) == 2)
        return 0;
    p->f04 = b;
    p->f08 = c;
    p->f1d = 1;
    p->f10 = 0;
    p->f18 = 0;
    return 1;
}
