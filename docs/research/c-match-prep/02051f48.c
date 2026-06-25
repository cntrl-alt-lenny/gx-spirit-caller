/* CAMPAIGN-PREP candidate for func_02051f48 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     byte field copy + switch-on-halfword tail call; reuse r1 sw value; sp3
 *   risk:       fields 0x1d/0x1e u8, 0x22 u16; func_0204fe54(a, p->f22, b) middle arg = leftover r1; sp3 routing
 *   confidence: low
 */
/* func_02051f48 -> src/main/func_02051f48.legacy_sp3.c (mwcc 1.2/sp3: push{r4,r5,lr}+sub sp,#4+pop pc) */
typedef struct {
    char _pad1d[0x1d];
    unsigned char  f1d;   /* +0x1d */
    unsigned char  f1e;   /* +0x1e */
    char _pad22[0x22 - 0x1f];
    unsigned short f22;   /* +0x22 */
} Obj;
extern Obj  *func_0205236c(void);
extern void  func_0204fe54(int, int, int);

void func_02051f48(int a, int b) {
    Obj *p = func_0205236c();
    unsigned short sw;
    p->f1d = p->f1e;
    sw = p->f22;                 /* stays in r1, reused as arg2 below */
    if (sw == 2 || sw == 3 || sw == 4)
        func_0204fe54(a, sw, b);
}
