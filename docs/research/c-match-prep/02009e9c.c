/* CAMPAIGN-PREP candidate for func_02009e9c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :5 bitfield gate; switch->const; strided RMW; store f56d before f56e; reload+clamp
 *   risk:       struct-guessed: the +0x156d field lives 0x156d past a 0x1c-stride base — offsets are inferred, confirm against real layout. Also `mode-1==2` may fold to `cmp #3` (orig keeps sub#1;cmp#2) — reshape-able via the explicit subtract.
 *   confidence: low
 */
/* func_02009e9c: gate on a 5-bit mode field, switch-select an increment, then a
   26-iteration RMW+clamp loop over a strided byte field, calling func_02009ab0(i+1). */
extern void func_02009ab0(int x);

/* data_02104f3c: word at 0xa74 with an unsigned :5 bitfield at bit 20
   (asm: and #0x1f00000; lsr#20 -> bitfield mask-then-shift). */
extern struct G02104f3c { char pad[0xa74]; unsigned lo : 20; unsigned mode : 5; } data_02104f3c;
/* data_0210593c: u16 selector at 0xa0. */
extern struct G0210593c { char pad[0xa0]; unsigned short sel; } data_0210593c;
/* data_02104f4c: array, stride 0x1c; the touched bytes sit at +0x156d / +0x156e. */
typedef struct Ent02104f4c { unsigned char pad[0x1c]; } Ent02104f4c;
extern Ent02104f4c data_02104f4c[];

void func_02009e9c(void)
{
    int add = 0;
    int i;
    if (data_02104f3c.mode - 1 != 2)
        return;
    switch (data_0210593c.sel) {
    case 0: add = 5;  break;
    case 1: add = 10; break;
    case 2: add = 20; break;
    }
    for (i = 0; i < 26; i++) {
        unsigned char *e = (unsigned char *)&data_02104f4c[i] + 0x1000;
        e[0x56d] = (unsigned char)(add + e[0x56e] + e[0x56d]);
        e[0x56e] = 0;
        if (e[0x56d] > 50)
            e[0x56d] = 50;
        func_02009ab0(i + 1);
    }
}
