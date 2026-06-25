/* CAMPAIGN-PREP candidate for func_0209a0a4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-assign clamp of ok flag (movlt/movge); array*8+4 store loop; blx via fn-ptr field
 *   risk:       permuter-class: tok reuses r4 after `count` no longer needed AND ok is built via movlt/movge predication then `ands ..,0xff` — mwcc may sequence the two-call ok differently. Also struct offsets struct-guessed.
 *   confidence: low
 */
/* func_0209a0a4 (main, class C) — channel open with IRQ guard + array init +
 * blx callback. reg block g=data_021a8394.
 *   g.f10 = ptr(a2); g.fc(h)=0; g.fe(h)=a1; g.f14(h)=a3;
 *   for (i=0;i<a3;i++) ((u8*)g.f10)[i*8 + 4]=0 (halfword store of 0)
 *   tok=DisableIrq();
 *   r=f_02096358(6, (a1&0xff)|0x02000100, 0);  if (r<0) ok=0;
 *   else { r=f_02096358(6, a0|0x01010000, 0); ok = (r>=0); }
 *   if ((ok&0xff)==0): RestoreIrq(tok); g.f34(h)|=2; cb=g.f0;
 *                      if(cb) cb(1,4,0);  return;
 *   else: g.f36(h)|=2; g.f34(h)&=~2; RestoreIrq(tok); return;
 * a0=r0(r6), a1=r1(r5) held across; tok reuses r4. */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern int  func_02096358(int chan, int arg, int flags);

typedef struct {
    void (*cb)(int, int, int); /* +0x0 */
    char _p4[0x8];             /* +0x4 */
    unsigned short fc;         /* +0xc */
    unsigned short fe;         /* +0xe */
    unsigned char *f10;        /* +0x10 */
    unsigned short f14;        /* +0x14 */
    char _p16[0x1e];           /* +0x16 */
    unsigned short f34;        /* +0x34 */
    unsigned short f36;        /* +0x36 */
} RegBlk_a8394;

extern RegBlk_a8394 data_021a8394;

void func_0209a0a4(int a0, int a1, void *buf, int count) {
    int tok;
    int ok;
    unsigned int i;
    data_021a8394.f10 = (unsigned char *)buf;
    data_021a8394.fc  = 0;
    data_021a8394.fe  = (unsigned short)a1;
    data_021a8394.f14 = (unsigned short)count;
    for (i = 0; i < (unsigned int)count; i++)
        *(unsigned short *)(data_021a8394.f10 + i * 8 + 4) = 0;
    tok = OS_DisableIrq();
    if (func_02096358(6, (a1 & 0xff) | 0x02000100, 0) < 0) {
        ok = 0;
    } else {
        ok = (func_02096358(6, a0 | 0x01010000, 0) >= 0) ? 1 : 0;
    }
    if ((ok & 0xff) == 0) {
        OS_RestoreIrq(tok);
        data_021a8394.f34 |= 2;
        if (data_021a8394.cb)
            data_021a8394.cb(1, 4, 0);
    } else {
        data_021a8394.f36 |= 2;
        data_021a8394.f34 &= ~2;
        OS_RestoreIrq(tok);
    }
}
