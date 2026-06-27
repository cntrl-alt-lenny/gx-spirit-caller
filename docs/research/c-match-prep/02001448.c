/* CAMPAIGN-PREP candidate for func_02001448 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: range-switch jump-table; (f_3c-1)<=3; bind base, reload p per arm
 *   risk:       permuter-class: already shipped as .s (brief 302) as reg-alloc-walled. Orig pins &data_021040ac in r4 and the addls-pc jump-table sub/add idiom; mwcc switch lowering + r4 reuse is a register-rotation coin-flip a C reshape likely won't close.
 *   confidence: low
 */
/* func_02001448: guarded nested switch dispatch.
 *   if (func_0200111c()) return 0;
 *   switch (p->f_3c) { case 1: switch(p->f_40){...set f_b64...} ...
 *     case 2: ...; func_02018b94()->f_14 &= ~0xff; ...f_10 &= ~0x200;
 *     case 4: ...f_b64=0x2b; case 3: return 1; default: return 0; }
 * NOTE: already ships as src/main/func_02001448.s (brief 302) -- deemed
 * reg-alloc-walled with NO C match. Provided as best-effort.
 * The orig holds &data_021040ac in r4 across the whole body and reloads
 * p (r0) from r4 at each switch arm; discriminant is (f_3c-1) range<=3. */

typedef struct {
    char         _pad0[0x3c];
    int          f_3c;    /* +0x3c switch discriminant */
    int          f_40;    /* +0x40 sub-discriminant */
    char         _pad1[0xb20];
    int          f_b64;   /* +0xb64 */
} state_021040ac_t;

typedef struct {
    char         _pad0[0x10];
    unsigned int f_10;    /* +0x10 */
    unsigned int f_14;    /* +0x14 */
} syswork_t;

extern state_021040ac_t data_021040ac;
extern int  func_0200111c(void);
extern void func_02000cc4(void);
extern syswork_t *func_02018b94(void);

int func_02001448(void) {
    state_021040ac_t *p = &data_021040ac;
    syswork_t *s;

    if (func_0200111c() != 0) {
        return 0;
    }
    switch (p->f_3c) {
    case 1:
        if (p->f_40 == 1) {
            func_02000cc4();
            p->f_b64 = 0x17;
        } else if (p->f_40 == 2) {
            func_02000cc4();
            p->f_b64 = 0x1f;
        }
        break;
    case 2:
        if (p->f_40 == 1) {
            func_02000cc4();
            p->f_b64 = 0x19;
        } else if (p->f_40 == 2) {
            func_02000cc4();
            p->f_b64 = 0x1b;
        }
        s = func_02018b94();
        s->f_14 &= ~0xffu;
        s = func_02018b94();
        s->f_10 &= ~0x200u;
        break;
    case 4:
        func_02000cc4();
        p->f_b64 = 0x2b;
        break;
    case 3:
        return 1;
    default:
        break;
    }
    return 0;
}
