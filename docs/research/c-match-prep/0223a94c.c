/* CAMPAIGN-PREP candidate for func_0223a94c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: state branch (0x80 before 0x7f compare order), :1/:5 bitfields, magic table-index reused, cnt+1<4 split
 *   risk:       struct-guessed + reshape-able: the cnt<4 vs >=4 branch picks 021de9d4+021e286c vs 021de910; arg r1/r2 order (parity then idx) is decl-order sensitive. h4_word_high placeholder must map to ((h4>>6)&1)?? confirm 021e286c arg extraction.
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022ce288[];
extern u8 data_ov002_022cf16c[];
extern int func_ov002_021de910(int a, int b, int c);
extern int func_ov002_021de9d4(int a, int b, int c);
extern int func_ov002_021e286c(int a);
extern int func_ov002_021e2bd4(void);
extern int func_ov002_021e2c5c(void);
extern int func_ov002_02210104(void);

typedef struct {
    u16 h0;
    u16 parity : 1; u16 idx : 5; u16 r2 : 10;   /* h2 */
    u16 c6 : 9; u16 f9 : 1; u16 r4 : 6;          /* h4: (h4>>6)&0x1ff ; (h4>>9? ) */
} Ent;

int func_ov002_0223a94c(Ent *e) {
    int state = *(int*)(data_ov002_022ce288 + 0x5a8);
    if (state == 0x80) { func_ov002_02210104(); return 0x7f; }
    if (state != 0x7f) return 0;
    int parity = e->parity;
    int idx = e->idx;
    u32 w = *(u32*)(data_ov002_022cf16c + parity * 0x868 + idx * 0x14 + 0x30);
    int composed = (((w >> 6) & 0xff) << 1) + ((w >> 13) & 1);
    if (e->c6 != composed) return 0;
    if (*(int*)(data_ov002_022ce288 + 0x484) == 0) return 0;
    func_ov002_021e2bd4();
    {
        int parity2 = e->parity;
        int idx2 = e->idx;
        int cnt = *(int*)(data_ov002_022ce288 + 0x484) + 1;
        if (cnt < 4) {
            func_ov002_021de9d4((int)e, parity2, idx2);
            func_ov002_021e286c(((e->h4_word_high) ) & 1);
        } else {
            func_ov002_021de910((int)e, parity2, idx2);
        }
    }
    func_ov002_021e2c5c();
    return 0;
}
