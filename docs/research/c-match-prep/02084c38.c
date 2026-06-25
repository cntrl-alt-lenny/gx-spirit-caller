/* CAMPAIGN-PREP candidate for func_02084c38 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload src->f_4 each use (fresh deref); store order verbatim; if-set flag block
 *   risk:       struct-guessed+permuter-class: orig reloads ldr [r4,#4] ~8x; if mwcc CSEs the sub-pointer into one reg those ldr collapse and every f_d4..f_e4 store diverges. Offsets inferred.
 *   confidence: low
 */
/* func_02084c38: object init. memset(dst,0,0x188), then copy/derive fields
 * from src (param2) into dst (param1). src->f_4 (a sub ptr) is RELOADED on
 * every access. Three lookup tables indexed by u8 fields. Flag block:
 * src->f0 bits 1/2/4/8 -> dst->f8 bits 0x80/0x100/0x200/0x400 (each reloads
 * dst->f8 and src->f0). Optional callback src->f28(dst); func_02084dc0(dst);
 * finally clear src->f0 bit0. Explicit byte offsets to keep load/store order
 * and the reload pattern exactly as emitted. */

extern int  data_021021b8[];
extern int  data_021021c4[];
extern int  data_021021d0[];
extern void func_02084dc0(void *dst);
extern void func_02094504(int val, void *dst, int size);

void func_02084c38(unsigned char *dst, unsigned char *src)
{
    func_02094504(0, dst, 0x188);
    *(int *)(dst + 0xc4) = 1;
    *(int *)(dst + 0x8)  = 1;

    if (*(int *)(src + 0x30) != 0) {
        *(int *)(dst + 0x0) = *(int *)(src + 0x30);
    } else {
        unsigned char *s = *(unsigned char **)(src + 0x4);
        *(int *)(dst + 0x0) = (int)(s + *(int *)(s + 0x4));
    }
    *(int *)(dst + 0x4) = (int)src;

    *(int *)(dst + 0xd4) = (int)(*(unsigned char **)(src + 0x4) + 0x40);
    {
        unsigned char *s = *(unsigned char **)(src + 0x4);
        *(int *)(dst + 0xd8) = (int)(s + *(int *)(s + 0x8));
    }
    {
        unsigned char *s = *(unsigned char **)(src + 0x4);
        *(int *)(dst + 0xdc) = (int)(s + *(int *)(s + 0xc));
    }
    *(int *)(dst + 0xe8) = data_021021c4[*(*(unsigned char **)(src + 0x4) + 0x15)];
    *(int *)(dst + 0xec) = data_021021b8[*(*(unsigned char **)(src + 0x4) + 0x15)];
    *(int *)(dst + 0xf0) = data_021021d0[*(*(unsigned char **)(src + 0x4) + 0x16)];
    *(int *)(dst + 0xe0) = *(int *)(*(unsigned char **)(src + 0x4) + 0x1c);
    *(int *)(dst + 0xe4) = *(int *)(*(unsigned char **)(src + 0x4) + 0x20);

    {
        int v = *(int *)(src + 0x20);
        if (v != 0) {
            unsigned int idx = *(unsigned char *)(src + 0x24);
            if (idx < 0x20) {
                *(int *)(dst + (idx << 2) + 0xc) = v;
                idx = *(unsigned char *)(src + 0x24);
                *(unsigned char *)(dst + idx + 0x8c) = *(unsigned char *)(src + 0x25);
            }
        }
    }

    if (*(int *)(src + 0x0) & 0x1) *(int *)(dst + 0x8) |= 0x80;
    if (*(int *)(src + 0x0) & 0x2) *(int *)(dst + 0x8) |= 0x100;
    if (*(int *)(src + 0x0) & 0x4) *(int *)(dst + 0x8) |= 0x200;
    if (*(int *)(src + 0x0) & 0x8) *(int *)(dst + 0x8) |= 0x400;

    {
        void (*cb)(void *) = *(void (**)(void *))(src + 0x28);
        if (cb != 0) cb(dst);
    }
    func_02084dc0(dst);
    *(int *)(src + 0x0) &= ~0x1;
}
