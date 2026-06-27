/* CAMPAIGN-PREP candidate for func_021ca18c (ov012, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     countdown copy loop; &0xf and &0xff gates; idx=n-1; bitfield byte counter
 *   risk:       large reg-reuse body: idx scaling (r1<<1 vs r1), the spill-slot order (sp+0x8/0xc) and the final 6-arg marshalling are inferred; reg-alloc/scheduling will likely differ. permuter-class (+ struct-guessed offsets)
 *   confidence: low
 */
/* func_ov012_021ca18c: assemble a draw call. Copy a 6-entry u16 table
 * (data_021cc0a4) and a 6-byte table (data_021cc06c+0x24) onto the stack,
 * gate on two counters, bump a frame counter, then index the copied tables by
 * idx and dispatch func_021caea8. STRUCT OFFSETS / TABLE TYPES INFERRED.
 *  for(i=6;i>0;i--) copy u16 pair src->dst16[i];        (loop, stride 2)
 *  for(b=0;b<6;b++) bytes[b] = data_021cc06c[0x24+b];
 *  n = data_021cc6a0[0x19c] & 0xf; if(n==0) return; idx = n-1;
 *  c = data_021cc6dc[0x164] & 0xff; if(c==0) return;
 *  if(c < 0xff) data_021cc6dc[0x164] = (data&~0xff)|((c+1)&0xff);
 *  a = dst16[idx] << 12 (low byte); b2 = dst16hi[idx] << 12; ...
 *  func_021caea8(...); */
extern char data_ov012_021cc06c[];
extern char data_ov012_021cc0a4[];
extern char data_ov012_021cc6a0[];
extern char data_ov012_021cc6dc[];
extern void func_ov012_021caea8(void *a, int b, void *c, int d, int e, int f);

void func_ov012_021ca18c(void) {
    unsigned char dst16[12];   /* sp+0x16: 6 u16 entries */
    unsigned char bytes[6];    /* sp+0x10 */
    int loA, loB;              /* sp+0x8 / sp+0xc spill slots */
    int idx, n, c;
    int i;
    unsigned char *src = (unsigned char *)data_ov012_021cc0a4;
    unsigned char *d   = dst16;

    for (i = 6; i != 0; i--) {
        d[0] = src[0];
        d[1] = src[1];
        src += 2;
        d += 2;
    }
    for (i = 0; i < 6; i++)
        bytes[i] = (unsigned char)data_ov012_021cc06c[0x24 + i];

    n = *(int *)(data_ov012_021cc6a0 + 0x19c) & 0xf;
    if (n == 0)
        return;
    idx = n - 1;

    c = *(int *)(data_ov012_021cc6dc + 0x164) & 0xff;
    if (c == 0)
        return;
    if (c < 0xff)
        *(unsigned int *)(data_ov012_021cc6dc + 0x164) =
            (*(unsigned int *)(data_ov012_021cc6dc + 0x164) & ~0xff) |
            ((c + 1) & 0xff);

    loA = dst16[idx * 2]      << 12;
    loB = dst16[idx * 2 + 1]  << 12;
    func_ov012_021caea8(&loA, 0, &loB, -1, 0x10, bytes[idx]);
}
