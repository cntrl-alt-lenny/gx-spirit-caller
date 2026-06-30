/* CAMPAIGN-PREP candidate for func_02063f70 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain + bool-normalize; 1-arg ignored-trailing-args thunk; bind f38
 *   risk:       1-arg func_02064364 extern relies on inherited r0=self; loc[9] scratch + f38 bind may reload; struct offsets guessed
 *   confidence: med
 */
/* func_02063f70: guard-chain dispatcher.
 * self->f0c!=0 || count<0x40 || compare-fail -> bool-normalized func_02064364(self).
 * else build a 0x24 scratch via func_02060fa4, validate via func_02062c00,
 * free f38, set f0c=1, return 1.
 *
 * func_02064364 is declared 1-arg here so the call emits only r0 (already self),
 * matching `bl func_02064364` with no r1/r2/r3 setup.
 */

typedef struct Obj Obj;
struct Obj {
    char _0[0x0c];
    int   f0c;            /* 0x0c */
    char _10[0x38 - 0x10];
    void *f38;            /* 0x38 */
    int   f3c;            /* 0x3c */
    char _40[0x68 - 0x40];
    int   f68;            /* 0x68 -- &self->f68 taken */
};

extern int  func_02064364(Obj *self);                     /* 1-arg view */
extern int  func_02060f68(void *a, void *b);
extern void *func_02060fa4(void *dst, void *src);
extern int  func_02062c00(Obj *self, void *buf, void *p, int q);
extern void func_02045364(void *p);

int func_02063f70(Obj *self, void *a, int count) {
    int loc[9];                       /* 0x24-byte scratch at sp */

    if (self->f0c != 0)              return func_02064364(self) != 0;
    if (count < 0x40)               return func_02064364(self) != 0;
    if (func_02060f68(a, &self->f68) == 0) return func_02064364(self) != 0;

    func_02060fa4(loc, (char *)a + 0x20);
    if (func_02062c00(self, loc, self->f38, self->f3c) == 0) return 0;

    {
        void *p = self->f38;
        if (p) {
            func_02045364(p);
            self->f38 = 0;
        }
    }
    self->f0c = 1;
    return 1;
}
