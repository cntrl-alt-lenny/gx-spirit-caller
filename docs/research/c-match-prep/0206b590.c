/* CAMPAIGN-PREP candidate for func_0206b590 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted-loop over list + teardown tail calls
 *   risk:       loop induction/CSE on p->field_4 reload may schedule differently; element field-0 type guessed
 *   confidence: high
 */
/* func_0206b590: iterate a list (count via func_02054140, element via
 * func_020540d0), invoke func_0206b6bc per element with its first field,
 * then teardown (func_02053bfc, func_0206b5e8).
 *
 *     mov r6,r0 ; n=func_02054140(p->_4); for(i=0;i<n;i++){
 *       e=func_020540d0(p->_4,i); func_0206b6bc(p, *e); }
 *     func_02053bfc(p->_4); func_0206b5e8(p);
 */

typedef struct Mgr Mgr;

extern int   func_02054140(void *list);
extern void *func_020540d0(void *list, int index);
extern void  func_0206b6bc(Mgr *p, void *v);
extern void  func_02053bfc(void *list);
extern void  func_0206b5e8(Mgr *p);

struct Mgr {
    char _pad_00[0x4];
    void *list;            /* +0x4 */
};

void func_0206b590(Mgr *p) {
    int i;
    int n = func_02054140(p->list);
    for (i = 0; i < n; i++) {
        void **e = (void **)func_020540d0(p->list, i);
        func_0206b6bc(p, e[0]);
    }
    func_02053bfc(p->list);
    func_0206b5e8(p);
}
