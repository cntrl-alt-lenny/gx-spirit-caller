/* CAMPAIGN-PREP candidate for func_020644c4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     flag-guard set-once; sequential calls; tail to func_02064aa0
 *   risk:       func_02062530 declared no-arg (r0 already self, byte-equal either way); f18 offset guessed
 *   confidence: high
 */
/* func_020644c4: set-once flag then run the open sequence.
 *   if self->f18 != 0 return;
 *   self->f18 = 1;
 *   func_02062530();
 *   if func_02061e88(self)==0 return;
 *   func_02064aa0(self);
 */

typedef struct Obj Obj;
struct Obj {
    char _0[0x18];
    int  f18;             /* 0x18 */
};

extern void func_02062530(void);
extern int  func_02061e88(Obj *self);
extern void func_02064aa0(Obj *self);

void func_020644c4(Obj *self) {
    if (self->f18 != 0) return;
    self->f18 = 1;
    func_02062530();
    if (func_02061e88(self) == 0) return;
    func_02064aa0(self);
}
