/* CAMPAIGN-PREP candidate for func_021bdcdc (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :1 bitfield toggle s->flag=!s->flag (bic/orr base-first); movs r0 then submi for (r<0)?fc-1:r; fixed call chain
 *   risk:       permuter-class: many obj->f50 reloads + r6/r4 held across 4 bls; the movs/submi predicated (r<0)?fc-1:r and the bit-toggle RMW are reshape-able, but the call-spanning reg lifetimes likely rotate. struct-guessed (helper sigs guessed too).
 *   confidence: low
 */
/* func_ov006_021bdcdc: per-frame update of the active 0x24-stride slot
 * (index obj->f50). On an empty slot, toggle its :1 bitfield and zero f0/f4/f8;
 * otherwise query/advance it via four ov006 helpers (bd6bc, b6d1c, be5b8,
 * b6e3c, bd700), RMW-toggling the bitfield between. Returns 1. (class D:
 * bitfield RMW + fixed call sequence.) */
extern char data_ov006_0224f448[];
extern int  func_ov006_021b6d1c(char *tbl, int sel, int x, int flag);
extern int  func_ov006_021b6e3c(char *tbl, int sel, int x, int flag);
extern int  func_ov006_021bd6bc(char *obj, int sel);
extern int  func_ov006_021bd700(char *obj, int sel, int value);
extern int  func_ov006_021be5b8(char *obj);

typedef struct {
    int f0;
    int f4;
    int f8;
    int fc;
    int f10;
    int pad14;
    int pad18;
    int pad1c;
    unsigned flag : 1;
    unsigned : 31;
} Ov006Slot;

int func_ov006_021bdcdc(char *obj) {
    int sel = *(int *)(obj + 0x50);
    Ov006Slot *s = (Ov006Slot *)(obj + 0xa0) + sel;
    char *tbl = data_ov006_0224f448;
    int r;
    int idx;

    if (s->fc == 0) {
        s->flag = !s->flag;
        s->f0 = 0;
        s->f4 = 0;
        s->f8 = 0;
    } else {
        r = func_ov006_021bd6bc(obj, sel);
        idx = (r < 0) ? (s->fc - 1) : r;
        r = func_ov006_021b6d1c(tbl, *(int *)(obj + 0x50), idx, s->flag);
        s->flag = !s->flag;
        func_ov006_021be5b8(obj);
        r = func_ov006_021b6e3c(tbl, *(int *)(obj + 0x50), r, s->flag);
        func_ov006_021bd700(obj, *(int *)(obj + 0x50), r);
    }
    return 1;
}
