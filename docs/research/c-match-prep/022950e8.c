/* CAMPAIGN-PREP candidate for func_022950e8 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     asymmetric-shift field@4, u16 f0 load-order, bit0, branch+tail call, bool >1
 *   risk:       f4 load order vs f0 may swap (orig loads [4] then [0]); >1 boolean movgt/movle shape; offsets guessed
 *   confidence: med
 */
/* func_ov002_022950e8: 9-bit field@+4 (asymmetric lsl#17;lsr#23) + f0@+0
 * feed func_021b4254; branch on `< 3` -> tail call, else bool `> 1`.
 *
 *     ldrh r0,[r5,#4]; ldrh r1,[r5]; lsl#17; lsr#23 -> field9, f0
 *     bl func_021b4254(field9, f0); cmp r0,#3; bge .L_38
 *     mov r0,r5; mov r1,r4; bl func_02291214(self, arg); pop  -> tail (<3 path)
 *  .L_38: ldrh; b0 ; rsb 1-b0 ; bl func_021bbf50(1-b0)
 *     cmp r0,#1; movgt#1; movle#0; pop                        -> return ret>1
 *
 * Asymmetric shift kept as raw C (mwcc folds only symmetric (x<<N)>>N).
 */

typedef unsigned short u16;

struct FuncOv002022950e8Self { u16 f0; u16 b0 : 1; u16 : 15; u16 f4; };

extern int func_ov002_021b4254(unsigned int field, unsigned int f0);
extern int func_ov002_021bbf50(unsigned int v);
extern int func_ov002_02291214(struct FuncOv002022950e8Self *self, int arg);

int func_ov002_022950e8(struct FuncOv002022950e8Self *self, int arg) {
    if (func_ov002_021b4254((unsigned int)(self->f4 << 17) >> 23, self->f0) < 3)
        return func_ov002_02291214(self, arg);
    return func_ov002_021bbf50(1 - self->b0) > 1;
}
