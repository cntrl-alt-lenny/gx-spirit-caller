/* CAMPAIGN-PREP candidate for func_0203d258 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Guarded lookup loop, stride 0x24; byte-key match + helper; indexed byte result
 *   risk:       Stride 0x24, offsets 0x3,0x1,0x4,0xa,0xd12 guessed; r2==0x20 early-exit; ldreqb signed result
 *   confidence: low
 */
/* func_0203d258: type==0x20 special then lookup over r1=cnt records.
 *  if(self->type==0x20 && func_0203d2e8()>0) return;
 *  key = self->f_a & 0xff;
 *  for i in 0..cnt:
 *    if(key == rec->b3 && func_020ab054(self+0xc, &rec->b4, self->f_a)==0)
 *       return (signed char)rec->b1;
 *  return -1;  (records stride 0x24, r4=rec ptr arg, r5=cnt)
 */
extern int func_0203d2e8(void);
extern int func_020ab054(void *a, void *b, unsigned short key);

typedef struct {
    char           _pad00[0xa];
    unsigned short f_a;     /* +0xa */
} Self;

typedef struct {
    unsigned char _b0;
    signed char   b1;       /* +0x1 (ldreqb result) */
    unsigned char _b2;
    unsigned char b3;       /* +0x3 (key compare) */
    unsigned char b4[0x24 - 4]; /* +0x4 passed to helper */
} Rec;

int func_0203d258(Self *self, int cnt, Rec *rec) {
    int i;
    unsigned int key;
    if (self->f_a == 0x20) {
        if (func_0203d2e8() > 0) return -1;
    }
    if (cnt <= 0) return -1;
    key = self->f_a & 0xff;
    for (i = 0; i < cnt; i++) {
        if (key == rec->b3) {
            if (func_020ab054((unsigned char *)self + 0xc, rec->b4, self->f_a) == 0) {
                return rec->b1;
            }
        }
        rec++;
    }
    return -1;
}
