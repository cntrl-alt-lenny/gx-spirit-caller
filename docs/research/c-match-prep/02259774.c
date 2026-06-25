/* CAMPAIGN-PREP candidate for func_02259774 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind base in one ptr; bitfield :13 and shift-extracts; if-not-ternary guard
 *   risk:       reshape-able: the two interleaved func_021c93f0 results (r7 from 2nd call, [r0] from 3rd) must keep distinct locals; if mwcc reorders the b6_13/top reads vs the 3rd call, the lsr#0x1f pair diverges. Confirm caller signature (3 args).
 *   confidence: low
 */
// func_ov002_02259774 — store block + repeated call, bitfield extracts
// base global data_ov002_022d016c accessed at fixed offsets, held in one reg (ip)

typedef struct { int low13 : 13; } BitA;        // [r0] -> lsl#0x13;lsr#0x13  (:13)
typedef struct { unsigned hi8 : 8; } BitB;       // [r0] -> lsl#2;lsr#0x18 then *2  (bits 6..13)
typedef struct { unsigned topbit : 13; } BitC;   // [r7] -> lsl#0x12;lsr#0x1f (top bit of low14)

extern unsigned char data_ov002_022d016c[];
extern int *func_ov002_021c93f0(int a, int b, int c);
extern int  func_ov002_021b9ecc(int a, int b);

#define G ((unsigned char *)data_ov002_022d016c)
#define WORD(off) (*(int *)(G + (off)))

int func_ov002_02259774(int a0, int a1, int a2, int a3)
{
    int *p;
    int v;
    int b6_13, top;

    WORD(0xd70) = a0;
    WORD(0xd74) = a1;
    WORD(0xd78) = a2;
    WORD(0xd64) = a3;
    WORD(0xd50) = 1;
    WORD(0xd68) = 0;

    p = func_ov002_021c93f0(a0, a1, a2);
    WORD(0xd5c) = ((unsigned)*p << 0x13) >> 0x13;

    func_ov002_021c93f0(a0, a1, a2);
    p = func_ov002_021c93f0(a0, a1, a2);

    b6_13 = (((unsigned)*p << 2) >> 0x18) << 1;
    top   = (unsigned)WORD(0) >> 0x1f; /* placeholder, replaced below */
    {
        int *r7 = p; /* second call result reused as r7 base read */
        top = ((unsigned)*r7 << 0x12) >> 0x1f;
    }
    WORD(0xd60) = b6_13 + top;
    WORD(0xd48) = 0;

    if (a1 > 4)
        return 0;

    v = func_ov002_021b9ecc(a0, a1 + a2);
    WORD(0xd5c) = v;
    return 0;
}
