/* CAMPAIGN-PREP candidate for func_02014bf4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GetSystemWork guard-chain (:1 bitfield test) + setter + tail call
 *   risk:       bit0 test must emit lsl#31;lsrs#31 -> rely on :1 bitfield, not &1; 0x920==1 and 969c()==3 gates; const 0xc0100
 *   confidence: med
 */
/* func_02014bf4: require state-bit0 @0x8d8 set, state[0x920]==1 and
 * func_0201969c()==3; then write 0xc0100 to arg[2] (off 8) and tail to
 * func_0201b7b4. */

extern char *GetSystemWork(void);
extern int func_0201969c(void);
extern void func_0201b7b4(void);

struct Bit0 { unsigned int b : 1; };

void func_02014bf4(char *o) {
    char *s = GetSystemWork();
    if (((struct Bit0 *)(s + 0x8d8))->b == 0) return;
    if (*(int *)(s + 0x920) != 1) return;
    if (func_0201969c() != 3) return;
    *(int *)(o + 8) = 0xc0100;
    func_0201b7b4();
}
