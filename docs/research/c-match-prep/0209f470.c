/* CAMPAIGN-PREP candidate for func_0209f470 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: Fill32 + ordered/conditional stores; flag |4 and 3rd halfword gated
 *   risk:       struct-guessed/permuter-class: the 5+ stack-arg-to-offset mapping is heavily inferred and the unconditional+conditional store interleave is what mwcc will most likely reorder; very likely ships as .s until offsets confirmed.
 *   confidence: low
 */
/* func_0209f470: like f404 but a richer record with a conditional flag bit
 * and a conditional third halfword, both gated on stack-arg @+0x54 != 0.
 * class D store-order + conditional stores. Many u16/u8 fields packed from
 * stack args; base flag word = 0x1e03, |4 when the gate is set.
 */

extern void Fill32(int v, void *dst, int size);
extern void func_0209f514(int a, int b, int c, int d, int e, void *rec);

struct Rec0f470 {
    int            flags;   /* +0   base 0x1e03, |4 if gate */
    unsigned short h4;      /* +4   = (u16)arg @+0x44 */
    unsigned short h6;      /* +6   = same */
    unsigned short h8;      /* +8   conditional (gate) */
    unsigned char  pad0[4]; /* +0xa..0xd */
    unsigned char  b0e;     /* placeholder to reach +0x16 region */
    unsigned char  pad1[7];
    unsigned short h16;     /* +0x16 = (u16)arg @+0x48 */
    unsigned char  pad2[7]; /* +0x18.. */
    unsigned char  b18;     /* +0x18 = arg @+0x4c (low byte) */
    unsigned char  b19;     /* +0x19 = arg @+0x50 */
    unsigned char  b1a;     /* +0x1a = arg @+0x58 */
    unsigned char  pad3[1]; /* round to 0x1c */
};

/* NOTE: offsets above are best-effort; the asm stores are:
 *   strb [0x22]<-arg58, strh [0x1e]<-arg48, strb [0x20]<-arg4c, strb [0x21]<-arg50,
 *   str  [0x08]<-0x1e03 (|4 cond), strh [0x0c]/[0x0e]<-arg44, strneh [0x10]<-arg44,
 *   str  [sp]<-arg40 (stack param e). Frame slot for &rec is sp+8.
 */

int func_0209f470(int a, int b, int c, int d,
                  int arg5, int arg6, int arg7, int arg8,
                  int arg9 /* @+0x58 */) {
    struct Rec0f470 rec;
    int gate;
    Fill32(0, &rec, 0x1c);
    /* stack-arg map (entry-sp + N):  +0=arg5? -- see note; using positional */
    {
        unsigned short h44 = (unsigned short)arg7;   /* [sp+0x44] */
        unsigned short h48 = (unsigned short)arg8;   /* [sp+0x48] */
        int v54 = arg6;                               /* [sp+0x54] gate */
        gate = v54;
        *((unsigned short *)((char *)&rec + 0x16)) = h48;
        *((unsigned char  *)((char *)&rec + 0x1a)) = (unsigned char)arg9;
        *((unsigned char  *)((char *)&rec + 0x18)) = (unsigned char)arg5;
        *((unsigned char  *)((char *)&rec + 0x19)) = (unsigned char)0;
        rec.flags = 0x1e03;
        if (gate != 0) rec.flags = 0x1e03 | 4;
        *((unsigned short *)((char *)&rec + 0x04)) = h44;
        *((unsigned short *)((char *)&rec + 0x06)) = h44;
        if (gate != 0) *((unsigned short *)((char *)&rec + 0x08)) = h44;
        func_0209f514(a, b, c, d, (int)(unsigned short)arg5, &rec);
    }
    return 0;
}
