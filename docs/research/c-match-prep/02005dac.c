/* CAMPAIGN-PREP candidate for func_02005dac (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch->r4 base; reload counter after call; mla via n*0xc+base+0x400
 *   risk:       reshape-able: must RELOAD the +0xa00 halfword after the call (asm re-ldrh into ip) and emit address as mla(ip,0xc,base+0x400) — keep the multiply un-CSE'd. Risk the post-increment store order vs address compute flips; if so reorder the n+1 store before the return expr. Bound-check movcs early-return must stay as if(>=0x80)return.
 *   confidence: med
 */
/* func_02005dac: same 3-way switch -> base, bound-check halfword counter
 * at base+0xa00 (<0x80), call func_02005d54(kind), then index a 0xc-byte
 * record at base+0x400 by the counter and post-increment the counter.
 *
 *   r2=kind; switch: 1->[d6c+0] 2->[d6c+4] default->0 => r4=base
 *   n = *(u16*)(base+0xa00); if (n>=0x80) return 0;
 *   func_02005d54(kind)
 *   ip = *(u16*)(base+0xa00)            ; RELOADED after call
 *   r0 = ip*0xc + (base+0x400)
 *   *(u16*)(base+0xa00) = ip+1
 *   return r0
 */

typedef struct {
    void *f_0;
    void *f_4;
} data_02103d6c_t;

extern data_02103d6c_t data_02103d6c;
extern void func_02005d54(int kind);

void *func_02005dac(int kind) {
    char *base;
    unsigned short n;
    switch (kind) {
    case 1:  base = (char *)data_02103d6c.f_0; break;
    case 2:  base = (char *)data_02103d6c.f_4; break;
    default: base = 0; break;
    }
    if (*(unsigned short *)(base + 0xa00) >= 0x80) {
        return 0;
    }
    func_02005d54(kind);
    n = *(unsigned short *)(base + 0xa00);
    *(unsigned short *)(base + 0xa00) = n + 1;
    return (void *)(base + 0x400 + n * 0xc);
}
