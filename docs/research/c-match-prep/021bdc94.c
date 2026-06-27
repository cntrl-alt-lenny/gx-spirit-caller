/* CAMPAIGN-PREP candidate for func_021bdc94 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: bank-mul + row-mul bases (no shared CSE); :13 state extract; addpl-pc range ladder as if-chain
 *   risk:       struct-guessed: _LIT3/_LIT4/_LIT5 word constants are unknown (asm truncates after .L_460 bl 021bc000), so thresholds and the addpl-pc jump-table body count cannot reproduce until the real literals are read.
 *   confidence: low
 */
/* func_ov002_021bdc94 (ov002, class D): bank=arg0&1 (stride 0x868), row=arg1*0x14.
 * Guard: u16 at data_022cf1a4[row+bank]!=0 -> return 0; then 021bd948()==0 ->0;
 * 021c9fc4(obj)==0 ->0. Read :13 state field at +0x30 of data_022cf16c table;
 * a range ladder (addpl-pc) over threshold consts dispatches a teardown /
 * per-state 02031838 path. Args: r0=obj, r1=idx. */

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  func_0202e42c(int a);
extern int  func_02031838(int state);
extern int  func_ov002_021bb90c(int obj);
extern int  func_ov002_021bc000(int obj, int arg);
extern int  func_ov002_021bd948(void);
extern int  func_ov002_021c9fc4(int obj);

/* Threshold word-consts read from literal pool; values not in the asm dump. */
#define OV002_THR   0   /* _LIT3 (struct-guessed) */
#define OV002_LIT4  0   /* _LIT4 */
#define OV002_LIT5  0   /* _LIT5 */

int func_ov002_021bdc94(int obj, int idx) {
    int bank = (obj & 1) * 0x868;
    int row  = idx * 0x14;
    int thr  = OV002_THR;
    int state;

    if (*(unsigned short *)(data_ov002_022cf1a4 + row + bank) != 0)
        return 0;
    if (func_ov002_021bd948() == 0)
        return 0;
    if (func_ov002_021c9fc4(obj) == 0)
        return 0;

    state = (*(int *)(data_ov002_022cf16c + bank + row + 0x30) << 19) >> 19;

    if (state < thr) {
        if (state > thr + 0x40) {
            if (state == OV002_LIT4)
                func_ov002_021bc000(obj, OV002_LIT5);
        } else {
            int d = state - (thr + 0x3b);
            if (d >= 0 && d <= 5) {
                func_02031838(state);
                if (func_ov002_021bb90c(obj) == 0)
                    return 0;
            }
        }
    } else if (state == thr - 0x84) {
        if (func_ov002_021bb90c(obj) != 0)
            return 0;
    }
    return 0;
}
