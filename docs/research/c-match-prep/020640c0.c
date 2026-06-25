/* CAMPAIGN-PREP candidate for func_020640c0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain; 1-arg thunk; two stack buffers; state=3 on success
 *   risk:       loc0/loc2 stack ordering (sp+0 vs sp+0x20) may flip; func_02061150 arity guessed 1-arg; offsets guessed
 *   confidence: med
 */
/* func_020640c0: guard-chain.
 * self->f0c!=2 || count<0x20 -> bool func_020643d8(self).
 * else copy src into loc0, build loc2, copy loc2 into self->f68 region,
 * validate via func_02062cfc: 0 -> return 0; else self->f0c=3, return 1.
 */

typedef struct Obj Obj;
struct Obj {
    char _0[0x0c];
    int  f0c;             /* 0x0c */
    char _10[0x68 - 0x10];
    int  f68;             /* 0x68 -- &self->f68 taken */
};

extern int  func_020643d8(Obj *self);                 /* 1-arg view */
extern void *func_02061018(void *dst, void *src);
extern void func_02061150(void *p);
extern int  func_02062cfc(Obj *self, void *a, void *b);

int func_020640c0(Obj *self, void *src, int count) {
    int loc0[8];          /* sp+0x00, 0x20 bytes */
    int loc2[8];          /* sp+0x20, 0x20 bytes */

    if (self->f0c != 2) return func_020643d8(self) != 0;
    if (count < 0x20)   return func_020643d8(self) != 0;

    func_02061018(loc0, src);
    func_02061150(loc2);
    func_02061018(&self->f68, loc2);

    if (func_02062cfc(self, loc0, loc2) == 0) return 0;
    self->f0c = 3;
    return 1;
}
