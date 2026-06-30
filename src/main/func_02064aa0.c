/* CAMPAIGN-PREP candidate for func_02064aa0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     flag-guard early-out; straight-line teardown calls; void tail
 *   risk:       func_02054e70/02054148 arg widths assumed 32-bit; func_0205531c no-arg; f0/f1c offsets guessed
 *   confidence: high
 */
/* func_02064aa0: teardown.
 *   if self->f1c != 0 { self->f14 = 1; return; }
 *   func_02054e70(self->f0);
 *   func_02054684(self->f0c);
 *   func_02054148(self->f10);
 *   func_020453b4(self);
 *   func_0205531c();
 */

typedef struct Obj Obj;
struct Obj {
    int  f0;              /* 0x00 */
    char _4[0x0c - 0x04];
    int  f0c;             /* 0x0c */
    int  f10;             /* 0x10 */
    int  f14;             /* 0x14 */
    char _18[0x1c - 0x18];
    int  f1c;             /* 0x1c */
};

extern void func_02054e70(int v);
extern void func_02054684(int v);
extern void func_02054148(int v);
extern void func_020453b4(void *p);
extern void func_0205531c(void);

void func_02064aa0(Obj *self) {
    if (self->f1c != 0) {
        self->f14 = 1;
        return;
    }
    func_02054e70(self->f0);
    func_02054684(self->f0c);
    func_02054148(self->f10);
    func_020453b4(self);
    func_0205531c();
}
