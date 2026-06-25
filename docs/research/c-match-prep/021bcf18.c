/* CAMPAIGN-PREP candidate for func_021bcf18 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     n=arg3?11:10 (movne#0xb/moveq#0xa); 13-bit id; flag-RMW via three if; cap u16 +0x38
 *   risk:       flag predicate uses cmp;cmpeq;ldrneh;cmpne fused chains; mwcc may CSE the two cap loads or reorder the b/c tests, shifting movne/moveq placement. reshape-able (split/reorder the three if-assigns).
 *   confidence: low
 */
/* func_ov002_021bcf18: scan n slots (n=11 if arg3 else 10) of player (p&1).
 * for each i: skip if id==0; if i<5 require func_ov002_021b8fcc(p,i)!=0; then
 * a flag is set when (b==0&&c==0) or (b&&cap!=0) or (c&&cap==0); count++ per set. */
extern unsigned char data_ov002_022cf16c[];
extern int func_ov002_021b8fcc(int a, int b);
struct slot { unsigned int id : 13; };

int func_ov002_021bcf18(int p, int b, int c, int arg3) {
    int n = arg3 ? 11 : 10;
    int count = 0;
    int i = 0;
    if (n > 0) {
        unsigned char *rec = data_ov002_022cf16c + (p & 1) * 0x868;
        unsigned char *row = rec + 0x30;
        for (i = 0; i < n; i++) {
            if (((struct slot *)row)->id != 0) {
                if (i >= 5 || func_ov002_021b8fcc(p, i) != 0) {
                    int hit = 0;
                    if (b == 0 && c == 0) hit = 1;
                    if (b != 0 && *(unsigned short *)(rec + 0x38) != 0) hit = 1;
                    if (c != 0 && *(unsigned short *)(rec + 0x38) == 0) hit = 1;
                    if (hit) count++;
                }
            }
            row += 20;
            rec += 20;
        }
    }
    return count;
}
