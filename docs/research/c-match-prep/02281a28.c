/* CAMPAIGN-PREP candidate for func_02281a28 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     arg1 guard BEFORE base math (compute arr inside the if); shared return-0 epilogue; :13 bitfield via arr120[arg2].f0
 *   risk:       VERIFIED EXACT mwcc 2.0/sp1p5 (byte-identical modulo cf16c pool reloc). Computing arr inside `if(arg1==0xb)` is load-bearing: it produces `cmp;bne shared-end` not unconditional mla. struct-guessed: arr120 +0x120 offset.
 *   confidence: high
 */
typedef unsigned int u32;
/* per-player region (cf16c, 0x868/player); arr120 = u32[] at +0x120,
 * element low-13 bits read lsl#19;lsr#19. */
struct ent { unsigned int f0 : 13; unsigned int _hi : 19; };
extern char data_ov002_022cf16c[];
extern unsigned int func_0202b878(int id);

int func_ov002_02281a28(int arg0, int arg1, int arg2) {
    struct ent *arr;
    if (arg1 == 0xb) {
        arr = (struct ent *)(data_ov002_022cf16c + (arg0 & 1) * 0x868 + 0x120);
        if (func_0202b878(arr[arg2].f0) == 0x16)
            return 1;
    }
    return 0;
}
