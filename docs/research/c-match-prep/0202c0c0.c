/* CAMPAIGN-PREP candidate for func_0202c0c0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early-return reads g[7]/g[6][i] inline (addne fold); reuse one len var across both blocks
 *   risk:       reshape-able + struct-guessed: the ne-predicated early return (addne sp;ldrne;addne) needs the C `if` to fold base+arr[i] without spilling; g[6]/g[7] (=+0x18/+0x1c) offsets inferred. Block A uses literal copy-len 8 (mov r2,#8) not a computed len -- keep it constant.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0202c0c0 (main, class C) -- batch p_0011.
 * UNVERIFIED build-free draft. Cache-hit early return then two stream-copy blocks.
 * g = data_0219a93c[0]; if (g[7]!=0) return g[7] + ((int*)g[6])[i];  (0x1c->idx7, 0x18->idx6)
 * else: blockA copies fixed 8 bytes of data_0219a948 (open data_020c6af4, write i*4);
 *       blockB recomputes len=data_0219a948[1]-data_0219a948[0], copies len (open data_020c6b08, write [0]).
 * Returns data_0219a948.  r4 reused: i*4 then len; r5=base value in block B.
 */
extern int  *data_0219a93c[];
extern int   data_0219a948[];
extern char  data_020c6af4[];
extern char  data_020c6b08[];
extern void  func_0202b12c(void *strm, char *name);
extern void  func_02038ad4(void *strm, void *buf, int len);
extern void  func_02092904(void *addr, int len);
extern int   func_02097ea4(void *strm, int off, int sel);
extern void  func_02097ff0(void *strm);
extern void  func_02098388(void *strm);

int *func_0202c0c0(int i) {
    unsigned char strm[0x48];
    int base;
    int len;
    int *g;
    g = data_0219a93c[0];
    if (g[7] != 0)
        return (int *)(g[7] + ((int *)g[6])[i]);
    len = i * 4;
    func_02098388(strm);
    func_0202b12c(strm, data_020c6af4);
    func_02097ea4(strm, len, 0);
    func_02092904(data_0219a948, 0x400);
    func_02038ad4(strm, data_0219a948, 8);
    func_02097ff0(strm);
    base = data_0219a948[0];
    len = data_0219a948[1] - base;
    func_02098388(strm);
    func_0202b12c(strm, data_020c6b08);
    func_02097ea4(strm, base, 0);
    func_02092904(data_0219a948, 0x400);
    func_02038ad4(strm, data_0219a948, len);
    func_02097ff0(strm);
    return data_0219a948;
}
