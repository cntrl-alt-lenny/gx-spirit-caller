/* CAMPAIGN-PREP candidate for func_0203d1c0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Guarded lookup loop; halfword-key match + helper call; indexed byte result
 *   risk:       Offsets 0x47c,0xd12,0x445,0x7a/0xa and stride 0xc0 guessed; r2==0x20 special-case + early ret
 *   confidence: low
 */
/* func_0203d1c0: type==0x20 special-case then lookup loop.
 *  if(self->type==0x20 && func_0203d2e8()>0) return; (void early-exit)
 *  cnt = ctx->cnt(byte@0xd12); region = ctx+0x47c; rec = self+0xc;
 *  for i in 0..cnt:
 *    if(self->f_a == region[i]->f_7a(halfword) &&
 *       func_020ab054(rec, &region[i], key)==0)
 *       return ctx->bytes[0x445 + i*4];
 *  return -1;
 */
extern int func_0203d2e8(void);
extern int func_020ab054(void *rec, void *entry, unsigned short key);

typedef struct {
    char           _pad00[0xa];
    unsigned short f_a;     /* +0xa */
} Self;

int func_0203d1c0(Self *self, unsigned char *ctx) {
    int i;
    int cnt;
    unsigned short key;
    unsigned char *region;
    unsigned char *rec;

    if (self->f_a == 0x20) {
        if (func_0203d2e8() > 0) return -1;
    }
    cnt = ctx[0xd12];
    if (cnt <= 0) return -1;
    key = self->f_a;
    region = ctx + 0x47c;
    rec = (unsigned char *)self + 0xc;
    for (i = 0; i < cnt; i++) {
        unsigned char *ent = region + i * 0xc0;
        if (key == *(unsigned short *)(ctx + i * 0xc0 + 0x47a + (0x400 - 0x47a))) {
            if (func_020ab054(rec, ent, key) == 0) {
                return *(signed char *)(ctx + i * 4 + 0x445);
            }
        }
    }
    return -1;
}
