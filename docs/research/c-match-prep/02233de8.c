/* CAMPAIGN-PREP candidate for func_02233de8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sel dispatch; compound a>=0&&b>=0&&c>=0 (cmpge chain); per-result inline mla index +0x260+i*4
 *   risk:       asm TRUNCATED: sel==0x64/0x6f arms and the .L_120 else-block are missing; a/b/c kept in r4/r5/r6 across calls (callee-saved). permuter-class (reg-alloc) + incomplete (LIT1-3 + tail unknown).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_02233de8 (ov002, class D) - brief 494.
 * UNVERIFIED build-free, TAIL TRUNCATED (the .L_120 / sel!=0x80 fall-through and
 * sel==0x64/0x6f arms cut off). sel = *(int*)(ce288 + 0x5a8).
 * sel==0x80: a=021ba294(attr&1,L1); b=021ba294(attr&1,L2); c=021ba294(attr&1,L3).
 *   if (a>=0 && b>=0 && c>=0) { 021e2b3c();
 *     if a>=0 021d8288(&cf16c[(attr&1)*0x868+0x260+a*4]); same for b, c;
 *     021e2c5c(); return 0x64 } else fall to L_120 (truncated).
 * compound a>=0&&b>=0&&c>=0 emits cmp;cmpge;cmpge (one branch target). L1/L2/L3
 * are three distinct constants/tables passed to 021ba294. */
typedef unsigned short u16;

extern char data_ov002_022ce288[];
extern char data_ov002_022cf16c[];
extern int  func_ov002_021ae400(void);
extern int  func_ov002_021ba294(int, int);
extern int  func_ov002_021d8288(void *);
extern int  func_ov002_021e286c(void);
extern int  func_ov002_021e2b3c(void);
extern int  func_ov002_021e2c5c(void);
extern int  func_ov002_0226b054(void);

/* L1/L2/L3 second args to 021ba294 - real values are in the truncated literal pool */
#define LIT1_3de8 0
#define LIT2_3de8 1
#define LIT3_3de8 2

int func_ov002_02233de8(void *cardv) {
    u16 *base = (u16 *)cardv;
    int sel = *(int *)(data_ov002_022ce288 + 0x5a8);

    if (sel == 0x80) {
        u16 attr = base[1];
        int a = func_ov002_021ba294(attr & 1, LIT1_3de8);
        attr = base[1];
        {
            int b = func_ov002_021ba294(attr & 1, LIT2_3de8);
            int c;
            attr = base[1];
            c = func_ov002_021ba294(attr & 1, LIT3_3de8);
            if (a >= 0 && b >= 0 && c >= 0) {
                func_ov002_021e2b3c();
                if (a >= 0) {
                    attr = base[1];
                    func_ov002_021d8288(data_ov002_022cf16c + (attr & 1) * 0x868 + 0x260 + a * 4);
                }
                if (b >= 0) {
                    attr = base[1];
                    func_ov002_021d8288(data_ov002_022cf16c + (attr & 1) * 0x868 + 0x260 + b * 4);
                }
                if (c >= 0) {
                    attr = base[1];
                    func_ov002_021d8288(data_ov002_022cf16c + (attr & 1) * 0x868 + 0x260 + c * 4);
                }
                func_ov002_021e2c5c();
                return 0x64;
            }
        }
    }
    /* sel==0x64 (.L_158), sel==0x6f (.L_13c), and .L_120 fall-through TRUNCATED */
    return 0;
}
