/* CAMPAIGN-PREP candidate for func_021c9c54 (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ternary base+mla(20B); bind map(r4) once; lin via mla; area=w*h; mvn=-1
 *   risk:       area = w*h: orig emits smulbb (16x16) but two unsigned-char operands likely give mwcc a plain mul, breaking that one instruction. reshape-able (try short w,h or (short)) but may resist -> permuter/escape.
 *   confidence: low
 */
/* func_ov006_021c9c54: map (col,row) on the active table row to a cell code:
   -1 if no map; map[row*[0x78]+col] when inside w*h; else 5 on the boundary (if
   +0x5c set) and 6/7 from +0x60. */
extern struct { int w0; unsigned chan : 3; } data_02104f4c;
struct E9c54 {                 /* exactly 20 bytes; w@6 h@7 map@0xc */
    char pad0[6];
    unsigned char w;
    unsigned char h;
    char pad8[4];
    short *map;
    char pad10[4];
};
extern struct E9c54 data_ov006_021ce650[];
extern struct E9c54 data_ov006_021ce8a8[];
int func_ov006_021c9c54(char *obj, int col, int row) {
    struct E9c54 *e = (data_02104f4c.chan == 0 ? data_ov006_021ce650 : data_ov006_021ce8a8)
                      + *(int *)(obj + 0x74);
    short *map = e->map;
    if (map == 0)
        return -1;
    {
        int lin = *(int *)(obj + 0x78) * row + col;
        int area = e->w * e->h;
        if (lin < area) {
            return map[lin];
        }
        if (*(int *)(obj + 0x5c)) {
            if (lin == area)
                return 5;
            return *(int *)(obj + 0x60) ? 6 : 7;
        }
        return *(int *)(obj + 0x60) ? 6 : 7;
    }
}
