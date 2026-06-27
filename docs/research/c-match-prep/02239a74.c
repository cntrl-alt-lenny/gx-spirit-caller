/* CAMPAIGN-PREP candidate for func_02239a74 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: 1-parity then :1 mask; raw shifts for packed coord; mla base via (p&1)*0x868; state branch order preserved
 *   risk:       struct-guessed + permuter-class: the .L_60 packed-coord unpack (w<<19>>19, w<<2>>24) and r0/r1 arg routing into 021e276c/278c are reg-heavy; arg sourcing for 0226af78 is uncertain and scheduling will rotate.
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022ce288[];
extern u8 data_ov002_022cf16c[];
extern u8 data_ov002_022cf178[];
extern u8 data_ov002_022d0e6c[];
extern int func_ov002_021e276c(int a, int b, int c, int d);
extern int func_ov002_021e278c(int a, int b, int c, int d);
extern int func_ov002_0226af78(int a, int b);

typedef struct { u16 h0; u16 parity : 1; u16 rest : 15; } Ent;

int func_ov002_02239a74(Ent *e) {
    int state = *(int*)(data_ov002_022ce288 + 0x5a8);
    if (state == 0x7f) {
        int p = 1 - e->parity;
        u32 base = (u32)data_ov002_022cf16c + (p & 1) * 0x868;
        int sel = *(int*)((data_ov002_022d0e6c) + 0xb0);          /* u16 idx */
        u32 w = *(u32*)(base + 0x120 + (*(u16*)(data_ov002_022d0e6c + 0xb0)) * 4);
        int a = (((w >> 6) & 0xff) << 1) + ((w >> 13) & 1);
        int b = (w << 19) >> 19;                                  /* r5 = (w<<19)>>19 then <<16>>16 */
        func_ov002_021e278c(a, 0, 0, 0);
        func_ov002_021e276c(e->parity, *(u16*)e, (short)b, 0x11);
        (void)sel; (void)base;
        return 0;
    }
    if (state == 0x80) {
        int p = 1 - e->parity;
        if (*(int*)(data_ov002_022cf178 + (p & 1) * 0x868) == 0) return 0;
        func_ov002_0226af78((p & 1) /*placeholder r0 path*/, 0);
        return 0x7f;
    }
    return 0;
}
