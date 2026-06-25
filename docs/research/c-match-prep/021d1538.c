/* CAMPAIGN-PREP candidate for func_021d1538 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     field-copy; 2-arm state machine; inc-before-call; poll guard-return then post+clear
 *   risk:       store-scheduling of the f_dc copy vs counter load may reorder; base-reg (ip) hold across f_2/f_810 may differ
 *   confidence: med
 */
/* func_ov002_021d1538: copy ce950.f_2 into d016c.f_dc, then 2-arm state
 * machine. state==0 -> increment counter then post event 6; else poll 6,
 * and only after it completes post event 0x24 and clear f_80c. */

typedef struct {
    char           _a[2];
    unsigned short f_2;
    char           _b[0x806];
    unsigned int   f_80c;
    unsigned int   f_810;
} StateCe950;

typedef struct {
    char _a[0xdc];
    int  f_dc;
} StateD016c;

extern StateCe950 data_ov002_022ce950;
extern StateD016c data_ov002_022d016c;
extern int func_ov002_0229ade0(int cmd, int a, int b, int c);
extern int func_ov002_0229c7f8(int a);

void func_ov002_021d1538(void) {
    data_ov002_022d016c.f_dc = data_ov002_022ce950.f_2;
    if (data_ov002_022ce950.f_810 == 0) {
        data_ov002_022ce950.f_810++;
        func_ov002_0229ade0(6, 0, 0, 0);
    } else {
        if (func_ov002_0229c7f8(6) != 0)
            return;
        func_ov002_0229ade0(0x24, 0, 0, 0);
        data_ov002_022ce950.f_80c = 0;
    }
}
