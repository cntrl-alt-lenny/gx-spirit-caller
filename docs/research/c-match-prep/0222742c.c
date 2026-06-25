/* CAMPAIGN-PREP candidate for func_0222742c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     7f-then-80 compare order; sel=1-bit0 via rsb; pass sel and sel&1 as args (both CSE-reused); mul (sel&1)*0x868
 *   risk:       reshape-able: both arg0(sel) and arg3(sel&1) are leftover regs from the index calc — relies on mwcc CSE keeping them un-reloaded. If it reloads, reorder so the index computation directly feeds the call.
 *   confidence: med
 */
/* func_ov002_0222742c: state step on global phase (data_022ce288+0x5a8).
 * 0x80: run 021e2b3c then de408(obj, 57704(obj)). 0x7f: sel = 1-h2.bit0;
 * if table data_022cf178[sel&1] set, dispatch via 021d7c1c else 021e2c5c. */

extern unsigned char data_ov002_022ce288[];
extern unsigned char data_ov002_022cf16c[];
extern unsigned char data_ov002_022cf178[];
extern int func_ov002_021d7c1c(int a, void *b, int c, int d);
extern int func_ov002_021de408(int a, int b);
extern int func_ov002_021e2b3c(void);
extern int func_ov002_021e2c5c(void);
extern int func_ov002_02257704(int a);

typedef struct Obj {
    unsigned short h0;          /* 0x00 */
    unsigned short f2b0 : 1;    /* 0x02 */
    unsigned short f2b1 : 15;
} Obj;

int func_ov002_0222742c(void *obj) {
    Obj *o = (Obj *)obj;
    int phase = *(int *)(data_ov002_022ce288 + 0x5a8);
    int sel;

    if (phase == 0x7f) {
        sel = 1 - o->f2b0;
        if (*(int *)(data_ov002_022cf178 + (sel & 1) * 0x868) == 0) {
            func_ov002_021e2c5c();
            return 0;
        }
        func_ov002_021d7c1c(sel,
                            &data_ov002_022cf16c[(sel & 1) * 0x868 + 0x120],
                            0, sel & 1);
        return 0x7f;
    }
    if (phase != 0x80) return 0;

    func_ov002_021e2b3c();
    func_ov002_021de408((int)obj, func_ov002_02257704((int)obj));
    return 0x7f;
}
