/* CAMPAIGN-PREP candidate for func_02064a2c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     flag-guard early-out; straight-line teardown calls; void tail
 *   risk:       func_02054dfc/02054148 arg widths assumed 32-bit; func_020552a8 no-arg; f0/f1c offsets guessed
 *   confidence: high
 */
/* func_02064a2c: teardown.
 *   if self->f1c != 0 { self->f14 = 1; return; }
 *   func_02054dfc(self->f0);
 *   func_02054610(self->f0c);
 *   func_020540d4(self->f10);
 *   func_02045364(self);
 *   func_020552a8();
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

extern void func_02054dfc(int v);
extern void func_02054610(int v);
extern void func_020540d4(int v);
extern void func_02045364(void *p);
extern void func_020552a8(void);

void func_02064a2c(Obj *self) {
    if (self->f1c != 0) {
        self->f14 = 1;
        return;
    }
    func_02054dfc(self->f0);
    func_02054610(self->f0c);
    func_020540d4(self->f10);
    func_02045364(self);
    func_020552a8();
}
