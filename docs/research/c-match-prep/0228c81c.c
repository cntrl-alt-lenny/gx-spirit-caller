/* CAMPAIGN-PREP candidate for func_0228c81c (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     helper result, ~(1<<shift) bit-clear, global store side-effect, tail call
 *   risk:       shift = arg4 + (arg1<<4) reg-alloc; eval order of store vs masked-call args; arg4 stack
 *   confidence: med
 */
/* func_ov002_0228c81c: clear bit (arg4 + arg1*16) from func_022576d8(arg0),
 * record arg1 in data_022cd524, then tail-call func_0228c584. */
extern int  func_ov002_022576d8(int arg0);
extern int  func_ov002_0228c584(int player, int mask, int arg2, int arg3);
extern int  data_ov002_022cd524;

int func_ov002_0228c81c(int arg0, int arg1, int arg2, int arg3, int arg4) {
    int v = func_ov002_022576d8(arg0);
    int m = v & ~(1 << (arg4 + (arg1 << 4)));
    data_ov002_022cd524 = arg1;
    return func_ov002_0228c584(arg1, m, arg2, arg3);
}
