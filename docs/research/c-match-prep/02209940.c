/* CAMPAIGN-PREP candidate for func_02209940 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-guard + bitfield range guards + shared return-0 + tail-call
 *   risk:       several shared `return 0` may need goto to branch (not predicate) to one epilogue; field reload between the two uses
 *   confidence: med
 */
/* func_ov002_02209940: 2-arg guard-chain (a=r0, b=self=r1) -> tail 021ff354.
 *   if (b == 0) return 0;
 *   if (func_02031794(b->f0) != 0) return 0;
 *   field = bits5..9 of u16@(b+2);
 *   if (field >= 5) {
 *       if (func_0202e234(b->f0) == 0) return 0;
 *       if (func_0202e270(b->f0) == 0) return 0;
 *   }
 *   if (field == 0xd) return 0;
 *   return func_021ff354(a, b);
 */
typedef unsigned short u16;
extern int func_02031794(int hw);
extern int func_0202e234(int hw);
extern int func_0202e270(int hw);
extern int func_ov002_021ff354(int a, void *b);

int func_ov002_02209940(int a, void *b) {
    unsigned int field;
    if (b == 0) return 0;
    if (func_02031794(*(u16 *)b) != 0) return 0;
    field = (unsigned)(*(u16 *)((char *)b + 2) << 26) >> 27; /* bits5..9 */
    if (field >= 5) {
        if (func_0202e234(*(u16 *)b) == 0) return 0;
        if (func_0202e270(*(u16 *)b) == 0) return 0;
    }
    if (field == 0xd) return 0;
    return func_ov002_021ff354(a, b);
}
