/* CAMPAIGN-PREP candidate for func_0204037c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     load fp into r4 (callee-saved) BEFORE the flag-branch; reload global for the blx arg, not g
 *   risk:       orig loads fp(r4) and the flag from the same base r1 before branching, and the blx arg is a RELOAD of data_0219d9d4 (not reuse of g/r4). If mwcc reuses g for the arg, one ldr drops vs orig. reshape-able (separate reload).
 *   confidence: med
 */
/* func_0204037c (C, 88B): guarded teardown + blx of stored fn-ptr, reloading the global.
 * g=*data_0219d9d4; if(g==0) return. b=g+0x1000; if(b[0x314]!=0) func_020418ac();
 * fp=b[0x210]; fp(data_020fe66c, *data_0219d9d4, 0); *data_0219d9d4 = 0.
 */
extern char data_020fe66c[];
extern char *data_0219d9d4;
extern void func_020418ac(void);

struct Ctx0204037c {
    unsigned char pad[0x1000];
    unsigned char sub[0x400];
    /* +0x1000+0x210 = fn ptr; +0x1000+0x314 = flag */
};

void func_0204037c(void) {
    char *g;
    void (*fp)(void *, char *, int);
    g = data_0219d9d4;
    if (g == 0) return;
    fp = *(void (**)(void *, char *, int))(g + 0x1000 + 0x210);
    if (*(int *)(g + 0x1000 + 0x314) != 0) {
        func_020418ac();
    }
    fp(data_020fe66c, data_0219d9d4, 0);
    data_0219d9d4 = 0;
}
