/* CAMPAIGN-PREP candidate for func_020624cc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-assert guard then field setter (str at 0x40)
 *   risk:       assert helper signature; arg order (p,v) preserved; line 0x19c via immediate not pool
 *   confidence: high
 */
/* func_020624cc: assert(p != NULL) then p->_0x40 = v.
 * args: r0=p (->r5), r1=v (->r4). assert line 0x19c fits an immediate
 * (mov r3,#0x19c) so only two pool words emit. */

extern char data_02101518[];   /* __FILE__ string */
extern char data_02101524[];   /* assertion message string */
extern void func_020a6d54(const char *file, const char *msg, int zero, int line);

typedef struct Obj {
    char _pad_00[0x40];
    int  field_40;            /* +0x40 */
} Obj;

void func_020624cc(Obj *p, int v) {
    if (p == 0)
        func_020a6d54(data_02101518, data_02101524, 0, 0x19c);
    p->field_40 = v;
}
