/* CAMPAIGN-PREP candidate for func_0223cf18 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     arg guard; mla (a0&1) stride +0x260; packed row decode; (b+i)<<25>>24 rec stride; unsigned scan
 *   risk:       reshape-able (decl/scan): scan base b loaded once into r3 (held across loop) + i in r2 — if mwcc reloads g[0x494] each iter, diverges. The (b+i)<<25>>24 is asym (raw). hi/id from same e: declare hi before id to match r4/r5 order.
 *   confidence: med
 */
/* func_ov002_0223cf18 (ov002, class D): guard arg1==13, decode a packed row from
 * the cf16c per-player table (+0x260 list), gate via 021bd85c then 0223b5cc, and
 * on hit scan ce288[0x6ac] cell records (+0x494 base, stride via packed byte) for
 * a matching id. */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

extern int  data_ov002_022ce288[];
extern int  data_ov002_022cf16c[];
extern int  func_ov002_021bd85c(int a, int b);
extern int  func_ov002_0223b5cc(int a, int b);

int func_ov002_0223cf18(int a0, int a1, int a2) {
    char *cf16c = (char *)data_ov002_022cf16c;
    int hi, id;
    if (a1 != 13) return 0;
    {
        int *base = (int *)(cf16c + (a0 & 1) * 0x868 + 0x260);
        u32 e = (u32)base[a2];
        hi = (int)(((u32)((e << 2) >> 0x18) << 1) + ((e << 0x12) >> 0x1f));
        id = (int)((e << 0x13) >> 0x13);
    }
    if (func_ov002_021bd85c(id, hi) != 0) return 0;
    if (func_ov002_0223b5cc(id, 0) == 0) return 0;
    {
        char *g = (char *)data_ov002_022ce288;
        u32 i = 0;
        u32 cnt = (u32)*(int *)(g + 0x6ac);
        if (cnt != 0) {
            int b = *(int *)(g + 0x494);
            do {
                char *rec = g + ((u32)((b + (int)i) << 0x19) >> 0x18) + 0x400;
                if ((u32)hi == (u32)*(u16 *)(rec + 0x98)) return 0;
                i++;
            } while (i < cnt);
        }
    }
    return 0x800;
}
