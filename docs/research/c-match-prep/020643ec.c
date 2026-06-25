/* CAMPAIGN-PREP candidate for func_020643ec (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     branch-tail guard chain on f0c; void side-effect calls; bool-normalize
 *   risk:       prologue mov/ldr scheduling may reorder; unused 4th param dropped; func_02061fa4 void-context; offsets guessed
 *   confidence: med
 */
/* func_020643ec: dispatch on self->f0c (the 4th param is ignored).
 *   f0c < 5:
 *     f10!=0 : func_02061fa4(self); return func_02061c5c(self,p1,0,0)!=0
 *     else   : if f0c==4 self->f14=1; func_02061fa4(self); return 1
 *   f0c == 7 : return 1
 *   else     : func_02061fa4(self); return func_02061a8c(self,p2)!=0
 */

typedef struct Obj Obj;
struct Obj {
    char _0[0x0c];
    int  f0c;             /* 0x0c */
    int  f10;             /* 0x10 */
    int  f14;             /* 0x14 */
};

extern void func_02061fa4(Obj *self);
extern int  func_02061c5c(Obj *self, int a, int b, int c);
extern int  func_02061a8c(Obj *self, int a);

int func_020643ec(Obj *self, int p1, int p2, int unused) {
    int s = self->f0c;
    if (s < 5) {
        if (self->f10 != 0) {
            func_02061fa4(self);
            return func_02061c5c(self, p1, 0, 0) != 0;
        }
        if (s == 4) self->f14 = 1;
        func_02061fa4(self);
        return 1;
    }
    if (s == 7) return 1;
    func_02061fa4(self);
    return func_02061a8c(self, p2) != 0;
}
