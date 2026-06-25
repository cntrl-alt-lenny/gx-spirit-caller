/* CAMPAIGN-PREP candidate for func_020532f4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     INIT/CLEAR memset + STORE-ORDER field writes; CRC; OR-flag
 *   risk:       offsets/struct shape guessed; func_02053230 call interleaved between f_1c and f_24 stores must keep that order; r5=self hoist
 *   confidence: med
 */
/* func_020532f4: straight init. memset, ordered field stores, two leaf
 * inits, a CRC compute into f_3c, then OR a flag bit.
 * STORE-ORDER recipe: keep field writes in the asm's order. */

typedef struct {
    unsigned int f_0;     /* 0x00 = 0x40 */
    char         _sub[0x18];   /* 0x04 inited by func_02053230(self+4) */
    char         _sub2[0x8];   /* 0x10 inited by func_02053600(self+0x10) */
    unsigned int f_1c;    /* 0x1c = 0 */
    unsigned int f_20;    /* 0x20 |= 1 */
    unsigned int f_24;    /* 0x24 = arg1 */
    unsigned int f_3c;    /* 0x3c = crc */
} obj_t;

extern void         func_020945f4(void *p, int v, unsigned n);   /* memset */
extern void         func_02053230(void *p);
extern void         func_02053600(void *p, int k);
extern void         func_020a67cc(void *buf, unsigned int poly);
extern unsigned int func_020a66e8(void *buf, void *data, int len);

void func_020532f4(obj_t *self, int arg1) {
    unsigned char buf[0x400];
    func_020945f4(self, 0, 0x40);
    self->f_0  = 0x40;
    self->f_1c = 0;
    func_02053230((char *)self + 4);
    self->f_24 = arg1;
    func_02053600((char *)self + 0x10, 0);
    func_020a67cc(buf, 0xedb88320u);
    self->f_3c = func_020a66e8(buf, self, 0x3c);
    self->f_20 |= 1;
}
