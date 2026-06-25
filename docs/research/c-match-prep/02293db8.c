/* CAMPAIGN-PREP candidate for func_02293db8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: store-order 1-then-0 with call between; mla(f0,0x868,base)+f1*0x14 reloaded each store
 *   risk:       orig re-derives f0,f1 from a fresh ldrh for the 2nd strh (r4 clobbered by base load) and emits mla in operand-order ip,0x868,base. mwcc may CSE the address across the call, dropping a store. reshape-able: separate exprs force reload
 *   confidence: low
 */
typedef struct Unit {
    unsigned short field0;
    unsigned short f0 : 1;
    unsigned short f1 : 5;
    unsigned short pad6 : 6;
    unsigned short f12 : 2;
    unsigned short f14 : 1;
    unsigned short pad15 : 1;
} Unit;

extern unsigned char data_ov002_022cf1a4[];
extern int func_ov002_02280980(int side);

int func_ov002_02293db8(Unit *u) {
    int r;
    if (u->f1 >= 0xa)
        return 0;
    if (func_ov002_02280980(u->f0) > 0)
        return 0;
    *(short *)(data_ov002_022cf1a4 + u->f0 * 0x868 + u->f1 * 0x14) = 1;
    r = func_ov002_02280980(u->f0);
    *(short *)(data_ov002_022cf1a4 + u->f0 * 0x868 + u->f1 * 0x14) = 0;
    return r > 0 ? 1 : 0;
}
