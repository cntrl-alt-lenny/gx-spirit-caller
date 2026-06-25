/* CAMPAIGN-PREP candidate for func_0201a0e0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Accessor (ldrsb signed-byte field) + commutative add operand order
 *   risk:       7-byte struct stride/+2 offset guessed; >>1 must stay arithmetic (signed v) to emit asr.
 *   confidence: med
 */
/* func_0201a0e0: leaf accessor.
 *   r4 = a; GetSystemWork() (discarded); r0 = func_02019604(a);
 *   tbl = data_020b5b80; entry stride 7 (rsb r2,r4,r4,lsl#3 = 7*a);
 *   ldrsb [tbl + 7*a + 2]  -> signed byte field at +2;
 *   add r0, r1, r0, asr#1  -> tableByte + (ret >> 1)  (signed asr).
 */

typedef signed char s8;

typedef struct {
    s8 b0;
    s8 b1;
    s8 b2;
    s8 b3;
    s8 b4;
    s8 b5;
    s8 b6;
} Entry7;

extern char *GetSystemWork(void);
extern int func_02019604(int a);
extern Entry7 data_020b5b80[];

int func_0201a0e0(int a) {
    int v;
    GetSystemWork();
    v = func_02019604(a);
    return data_020b5b80[a].b2 + (v >> 1);
}
