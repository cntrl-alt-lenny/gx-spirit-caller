/* CAMPAIGN-PREP candidate for func_02064580 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     deref-both-args; bind *pb across f0c check into func_0206205c r1; nested guards
 *   risk:       *pb dead-looking load must stay hoisted and feed func_0206205c 2nd arg; mwcc could sink/elide; offsets guessed
 *   confidence: low
 */
/* func_02064580: comparator-style callback.
 *   a = *(Obj**)pa;  b = *pb;            (b held in r1 across the f0c test)
 *   if (a->f0c != 7) { if (func_0206205c(a, b) == 0) return 0; }
 *   if (a->f0c == 7 && a->f14 == 0 && a->f24 == 0) func_02064790(a);
 *   return 1;
 */

typedef struct Obj Obj;
struct Obj {
    char _0[0x0c];
    int  f0c;             /* 0x0c */
    int  f10;             /* 0x10 (unused here) */
    int  f14;             /* 0x14 */
    char _18[0x24 - 0x18];
    int  f24;             /* 0x24 */
};

extern int  func_0206205c(Obj *a, int b);
extern void func_02064790(void *e);

int func_02064580(void *pa, int *pb) {
    Obj *a = *(Obj **)pa;
    int  b = *pb;

    if (a->f0c != 7) {
        if (func_0206205c(a, b) == 0) return 0;
    }
    if (a->f0c == 7 && a->f14 == 0 && a->f24 == 0) {
        func_02064790(a);
    }
    return 1;
}
