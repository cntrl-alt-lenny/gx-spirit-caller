/* CAMPAIGN-PREP candidate for func_0223bcb4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order init; packed row f22*2+f13 decode; (v<<19)>>19 raw asym; ce288 field offsets
 *   risk:       reshape-able (idx decode): the (e<<2)>>24 / (e<<18)>>31 pair must be raw asym shifts (folds wrong as masks); loop counter r7=2 const passed as arg2 to 0223b5cc. If reg-alloc on g (held in r6) reloads, minor.
 *   confidence: med
 */
/* func_ov002_0223bcb4 (ov002, class D): init two ce288 fields, gate via
 * 02030b84/02031684, store a result flag, then loop arg2[i] for i<ce288[0x6a4]
 * decoding a packed row index into the d0250 table and feeding 0223b5cc; final
 * 3-way success check on ce288 state. */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

extern int  data_ov002_022ce288[];
extern u16  data_ov002_022d0250[];
extern int  func_02030b84(int a);
extern int  func_02031684(int a);
extern int  func_ov002_0223b584(void);
extern int  func_ov002_0223b5cc(int a, int b);

int func_ov002_0223bcb4(int a0, int a1, int *list) {
    char *g = (char *)data_ov002_022ce288;
    int i, n, r2;
    if (func_02030b84(a0) == 0) return 0;
    *(int *)(g + 0x69c) = a0;
    *(int *)(g + 0x6a4) = a1;
    r2 = (func_02031684(a0) == 0) ? 1 : 0;
    *(int *)(g + 0x6b0) = r2;
    *(int *)(g + 0x6a8) = 0;
    func_ov002_0223b584();
    i = 0;
    n = *(int *)(g + 0x6a4);
    if (n > 0) {
        u16 *tbl = data_ov002_022d0250;
        do {
            u32 e = (u32)list[i];
            int idx = (int)(((u32)((e << 2) >> 0x18) << 1) + ((e << 0x12) >> 0x1f));
            u32 v = (u32)tbl[idx];
            if (func_ov002_0223b5cc((int)((v << 0x13) >> 0x13), 2) == 0) return 0;
            i++;
        } while (i < *(int *)(g + 0x6a4));
    }
    if (*(int *)(g + 0x69c) == 0x1a4e && *(int *)(g + 0x6b4) != 0) {
        if (*(int *)(g + 0x6a8) == 0) return 0;
    }
    return 1;
}
