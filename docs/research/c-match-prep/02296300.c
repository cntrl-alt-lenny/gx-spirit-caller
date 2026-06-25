/* CAMPAIGN-PREP candidate for func_02296300 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     long guard chain, re-read bit0 / 1-bit0, global deref
 *   risk:       6 sequential guards + 022d016c+0xcf8 deref; arg mix (bit0 vs 1-bit0) and final ==0 map should hold; offsets assumed
 *   confidence: med
 */
/* func_ov002_02296300: linear guard-chain predicate. Each guard re-reads
 * self->bit0 (ldrh+2;lsl#31;lsr#31). Guards 1&3 pass (1-bit0); guards
 * 4,5,6 pass bit0. Mid check reads *(int*)(022d016c+0xcf8)==4. */
typedef unsigned short u16;

struct S02296300 {
    u16 f0;
    u16 bit0 : 1;
};

extern char data_ov002_022d016c[];
extern int func_ov002_02257ab8(struct S02296300 *self, int bit);
extern int func_ov002_02281760(struct S02296300 *self, int bit, int c);
extern int func_ov002_02259f74(int bit);
extern int func_ov002_02280980(int bit);
extern int func_ov002_02285dd0(int bit, int b);

int func_ov002_02296300(struct S02296300 *self) {
    if (func_ov002_02257ab8(self, 1 - self->bit0) == 0)
        return 0;
    if (*(int *)(data_ov002_022d016c + 0xcf8) == 4)
        return 1;
    if (func_ov002_02281760(self, 1 - self->bit0, 0) != 0)
        return 1;
    if (func_ov002_02259f74(self->bit0) == 0)
        return 1;
    if (func_ov002_02280980(self->bit0) < 0)
        return 1;
    return func_ov002_02285dd0(self->bit0, 0) == 0;
}
