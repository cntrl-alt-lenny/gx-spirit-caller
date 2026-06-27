/* CAMPAIGN-PREP candidate for func_021d0fa0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: if(state==0) keeps main inline (bne to busy); swap-map 1<->2; conditional parity select; parity-mul cf198
 *   risk:       permuter-class: orig fully PREDICATES the sel!=2 parity arm (andne;mulne;ldrne;bne) and uses moveq for the idx==2 swap leg; mwcc -O4 will likely branch these instead. Scheduling-sensitive tail.
 *   confidence: low
 */
/* func_ov002_021d0fa0 (cls D): busy-gated. When flag matches (cd73c+4)^1,
 * swap-map idx (1<->2) and stash @+4/@+6; then parity-mul lookup into cf198
 * keyed by (sel==2 ? (ip^1) : ip)&1, post a 0x2 command, bump state810. */
typedef unsigned short u16;
extern char data_ov002_022ce950[];
extern char data_ov002_022cd73c[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf198[];
extern char data_ov002_022d016c[];
extern int  func_ov002_0229ade0(int cmd, int a, int b, int c);
extern int  func_ov002_0229c7f8(int cmd);

void func_ov002_021d0fa0(void) {
    int flag = (*(u16 *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    int state = *(int *)(data_ov002_022ce950 + 0x810);
    int idx = *(u16 *)(data_ov002_022ce950 + 2);
    if (state == 0) {
        int ip = *(int *)(data_ov002_022cd73c + 4);
        int other = ip ^ 1;
        int sel = idx;
        int parity, val;
        if (flag == other) {
            if (idx == 1) sel = 2;
            else if (idx == 2) sel = 1;
            *(int *)(data_ov002_022d016c + 0xd00) = sel;
            *(int *)(data_ov002_022cf16c + 0x2c) = *(u16 *)(data_ov002_022ce950 + 4);
            *(int *)(data_ov002_022cf16c + 0x894) = *(u16 *)(data_ov002_022ce950 + 6);
        }
        if (sel != 2)
            parity = ip & 1;
        else
            parity = other & 1;
        val = *(int *)((char *)data_ov002_022cf198 + parity * 0x868);
        *(int *)(data_ov002_022cd73c + 0x228) = val;
        func_ov002_0229ade0(0x2, sel, val, 0);
        *(int *)(data_ov002_022ce950 + 0x810) =
            *(int *)(data_ov002_022ce950 + 0x810) + 1;
    } else {
        if (func_ov002_0229c7f8(0x2) == 0)
            *(int *)(data_ov002_022ce950 + 0x80c) = 0;
    }
}
