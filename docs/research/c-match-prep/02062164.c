/* CAMPAIGN-PREP candidate for func_02062164 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted loop, unsigned-threshold guard, tail-call bool short-circuit
 *   risk:       reg-alloc on i/n (r4/r5) or list-reload at [r7,#0x60] each iter may flip; element field offset 0xc guessed
 *   confidence: med
 */
/* func_02062164: counted loop over a list with an unsigned threshold.
 *   n = func_02054140(p->list);          // list element count (signed)
 *   for (i = 0; i < n; i++) {
 *       e = func_020540d0(p->list, i);    // element pointer
 *       if ((u32)(thr - e->_0xc) > 1000)  // bls => unsigned <= continue
 *           if (!func_02062834(p)) return 0;
 *   }
 *   return 1;
 */

typedef unsigned int u32;

typedef struct Elem {
    char _pad_00[0xc];
    int  field_c;            /* +0xc */
} Elem;

typedef struct Obj {
    char  _pad_00[0x60];
    void *list;              /* +0x60 */
} Obj;

extern int   func_02054140(void *list);
extern Elem *func_020540d0(void *list, int index);
extern int   func_02062834(Obj *p);

int func_02062164(Obj *p, int thr) {
    int n = func_02054140(p->list);
    int i;
    for (i = 0; i < n; i++) {
        Elem *e = func_020540d0(p->list, i);
        if ((u32)(thr - e->field_c) > 0x3e8) {
            if (func_02062834(p) == 0)
                return 0;
        }
    }
    return 1;
}
