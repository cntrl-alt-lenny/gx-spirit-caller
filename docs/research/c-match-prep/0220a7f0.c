/* CAMPAIGN-PREP candidate for func_0220a7f0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     6-bit field eq-guard + global==2 guard + `?2:0` ternary tail
 *   risk:       early return-0 guards may predicate vs orig branch; ternary?2:0 vs if-form is the steer (orig has movne+moveq => ternary)
 *   confidence: med
 */
/* func_ov002_0220a7f0: field6 dispatch + state==2 guard + ternary-mapped call.
 *   if (field6(u16@+2) == 0x23) return 0;
 *   if (*(int*)(d016c+0xcf8) != 2)  return 0;
 *   return func_0220803c(self) ? 2 : 0;   (movne#2; moveq#0)
 */
typedef unsigned short u16;
struct S0220a7f0 { u16 b0 : 1; u16 pad : 5; u16 k : 6; };
extern char data_ov002_022d016c[];
extern int func_ov002_0220803c(void *self);

int func_ov002_0220a7f0(void *self) {
    struct S0220a7f0 *s = (struct S0220a7f0 *)((char *)self + 2);
    if (s->k == 0x23) return 0;
    if (*(int *)(data_ov002_022d016c + 0xcf8) != 2) return 0;
    return func_ov002_0220803c(self) ? 2 : 0;
}
