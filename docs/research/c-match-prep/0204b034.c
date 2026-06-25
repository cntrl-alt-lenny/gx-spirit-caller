/* CAMPAIGN-PREP candidate for func_0204b034 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD(ptr+byte) + INIT clears + u64-split stores + arg guard
 *   risk:       dc84 struct offsets guessed; r4!=0 guard placement vs second u64 store
 *   confidence: med
 */
/* func_0204b034: g = data_0219dc84; if g==0 return; if g->f0(byte)==0 return;
 * clear g->f8=0, g->fc=0, g->f2(byte)=0; func_020930b0() (u64)-> g->f18/g->f1c;
 * if arg!=0 return; else func_020930b0() again -> g->f10/g->f14. */

typedef struct {
    unsigned char f0;   /* +0x00 */
    char          _pad0[1];
    unsigned char f2;   /* +0x02 */
    char          _pad1[5];
    int           f8;   /* +0x08 */
    int           fc;   /* +0x0c */
    int           f10;  /* +0x10 */
    int           f14;  /* +0x14 */
    int           f18;  /* +0x18 */
    int           f1c;  /* +0x1c */
} State0204b034;

extern State0204b034 *data_0219dc84;
extern long long func_020930b0(void);

void func_0204b034(int a0) {
    long long v;
    if (data_0219dc84 == 0) return;
    if (data_0219dc84->f0 == 0) return;
    data_0219dc84->f8 = 0;
    data_0219dc84->fc = 0;
    data_0219dc84->f2 = 0;
    v = func_020930b0();
    data_0219dc84->f18 = (int)v;
    data_0219dc84->f1c = (int)(v >> 32);
    if (a0 != 0) return;
    v = func_020930b0();
    data_0219dc84->f10 = (int)v;
    data_0219dc84->f14 = (int)(v >> 32);
}
