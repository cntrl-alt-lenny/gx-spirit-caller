/* CAMPAIGN-PREP candidate for func_021b3cf0 (ov019, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: re-emit `mla r1,(c+d),12,obj` per case (orig recomputes, don't hoist e); bind data global to local g for +0x48 store.
 *   risk:       struct-guessed + TRUNCATED: state-2 body cut off; obj field offsets (0xc,0x10,0x14,0x18,0x1c) and the *12 stride entry struct are inferred; func_02037208 arg `-1` derived from `sub r0,0x42,0x43`.
 *   confidence: low
 */
// func_ov019_021b3cf0 : state dispatch, mla struct index (obj + slot*12)
// NOTE: source asm TRUNCATED mid state-2; states 0/1 complete, state 2 partial.
extern void *GetSystemWork(void);
extern int   func_02019124(void);
extern int   func_02037208(int a, int b, int c, int d);
extern int   data_021040ac;
extern int   data_ov019_021b6848;     // _LIT0 global (has +0x48 field)

struct Ent19 { char pad[0x18]; int f18; short f1c; short f14; };

int func_ov019_021b3cf0(int *obj, int state)
{
    if (state == 0) {
        int *g = &data_ov019_021b6848;
        g[0x48/4] = 0;
        func_02037208(0x42, -1, 0, 1);
        return 1;
    }
    if (state == 1) {
        int slot = obj[0xc/4] + obj[0x10/4];
        char *e = (char *)obj + slot * 0xc;
        if (*(int *)(e + 0x18) != 0 && *(short *)(e + 0x1c) != 0) {
            int r = func_02019124();
            if (r == 0xff) {
                int *sw = (int *)GetSystemWork();
                if ((unsigned)(sw[0x900/4] << 7) >> 31) {
                    /* bit set -> fall through to default */
                } else {
                    func_02037208(0x43, -1, 0, 1);
                    return 0;
                }
            }
            {
                int *g = &data_ov019_021b6848;
                short v = *(short *)(e + 0x14);
                g[0x48/4] = v;
                func_02037208(0x3a, -1, 0, 1);
                return 1;
            }
        } else {
            func_02037208(0x43, -1, 0, 1);
            return 0;
        }
    }
    if (state == 2) {
        char *e = (char *)obj + (obj[0xc/4] + obj[0x10/4]) * 0xc;
        short v = *(short *)(e + 0x14);
        int *p = &data_021040ac;
        if (v != p[0xc0/4]) { p[0xc0/4] = v; /* TRUNCATED remainder */ }
    }
    return 0;
}
