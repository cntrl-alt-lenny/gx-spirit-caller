/* CAMPAIGN-PREP candidate for func_0206c3f4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     branch-table: switch on signed f73, cases 0/4,1,2 share .L_138 body, tail f70=1
 *   risk:       branch-table layout: orig emits `cmp#4; addls pc,pc,r0,lsl#2; b default` with table[0..4]=138,148,15c,160,138 (cases 0&4 share .L_138). If mwcc orders case bodies differently or picks if-chain over addls-table, diverges. reshape-able via case ordering; else permuter/.s. struct-guessed.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_0206c3f4 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: branch-table on (s8)f73, 5 cases; common tail sets f70=1, returns 0
 * func_0206c3f4(p): c = p->sub; func_02071028(c);
 *   switch ((signed char)c->f73)  ; cmp#4 + addls pc -> jump table
 *     case 0: case 4: func_02070f0c(eng+0x20); func_02070f44(); break;  // .L_138
 *     case 1: func_02070f44(); func_02070fe8(); func_02070ea8(func_0206ca4c); break; // .L_148
 *     case 2: func_02070fe8(); break;             // .L_15c (falls to tail)
 *     // case 3 + default -> tail only (.L_160)
 *   c->f70 = 1; return 0;
 */
typedef struct Sub Sub;
struct Sub {
    char _pad_00[0x68];
    char *eng;          /* +0x68 ldr (engine base) */
    char _pad_6c[0x70 - 0x6c];
    short f70;          /* +0x70 strh = 1 */
    char _pad_72[1];
    signed char f73;    /* +0x73 ldrsb dispatch */
};
struct Ptr { char _pad_00[0x4]; Sub *sub; };  /* param: sub at +0x4 */

extern void func_02071028(Sub *c);
extern void func_02070f0c(void *p);
extern void func_02070f44(void);
extern void func_02070fe8(void);
extern void func_02070ea8(void *tag);
extern void func_0206ca4c(void);              /* _LIT0, by address */

int func_0206c3f4(struct Ptr *p) {
    Sub *c = p->sub;
    func_02071028(c);
    switch (c->f73) {
    case 0:
    case 4:
        func_02070f0c(c->eng + 0x20);
        func_02070f44();
        break;
    case 1:
        func_02070f44();
        func_02070fe8();
        func_02070ea8((void *)func_0206ca4c);
        break;
    case 2:
        func_02070fe8();
        break;
    default:
        break;
    }
    c->f70 = 1;
    return 0;
}
