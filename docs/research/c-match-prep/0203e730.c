/* CAMPAIGN-PREP candidate for func_0203e730 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     64-bit /const via helper; bit7 = (b<<24)>>31; reload f_d0f each loop iter
 *   risk:       permuter-class: i*0xc0 stride + 0x474/0x47c/0x4a6 base fusion (mul ip;add) and loop reg-alloc (r2/r3 reloaded from d12/d0f each pass) unlikely to match first build; offsets struct-guessed.
 *   confidence: low
 */
/* func_0203e730 — 64-bit timer delta /0x82ea threshold, then two scan loops
 * over arr447 testing bit7, increment counter, struct-stride math.
 * Class D: 64-bit divmod helper + bit-7 bitfield + heavy struct addressing. */
extern void func_020930b0(void);             /* reads 64-bit timer into r0:r1 */
extern unsigned long long func_020b3808(unsigned long long, unsigned);
extern void func_0203e540(void *, int);
extern void func_0203e3d4(void *, void *, int, int);

/* timer read modelled as 64-bit return so (now-stored) lowers to subs/sbc */
extern unsigned long long Timer_read(void);

typedef struct Ctx {
    unsigned char _p0[0xcb0];
    unsigned long long stamp;      /* 0xcb0/0xcb4 little-endian 64-bit */
    unsigned char _p1[0xd0f - 0xcb8];
    unsigned char f_d0f;           /* 0xd0f index/counter */
    unsigned char _p2[2];          /* d10,d11 */
    unsigned char f_d12;           /* 0xd12 limit */
    unsigned char _p3[0x447 - 0xd13];
    unsigned char arr447[1];       /* 0x447 stride 4: bit7 flag, [idx<<2] */
    unsigned char _p4[0x474 - 0x448];
    unsigned char arr474[1];       /* 0x474 stride 4: counter byte */
} Ctx;

int func_0203e730(void *ctx) {
    Ctx *c = (Ctx *)ctx;
    unsigned long long d = (Timer_read() - c->stamp) << 6;
    unsigned char i;
    if (func_020b3808(d, 0x82ea) >= 0x96 ||
        ((&c->arr447[0])[c->f_d0f << 2] << 24) >> 31 == 1) {
        (&c->arr447[0])[c->f_d0f << 2] |= 0x80;
        for (i = c->f_d0f; i < c->f_d12; i = c->f_d0f) {
            if (((((&c->arr447[0])[i << 2]) << 24) >> 31) == 0) break;
            (&c->arr474[0])[0]++;
        }
        if (c->f_d12 <= c->f_d0f) {
            c->f_d0f = 0;
            func_0203e540(c, 4);
            return 4;
        }
        {
            unsigned long long t = Timer_read();
            unsigned idx = c->f_d0f;
            unsigned short h = *(unsigned short *)((char *)c + 0x4a6 + idx * 0xc0);
            c->stamp = t;
            func_0203e3d4((char *)c + 0x474 + idx * 0xc0,
                          (char *)c + 0x47c + idx * 0xc0,
                          h - 1, 0x300000);
        }
    }
    return 4;
}
