/* CAMPAIGN-PREP candidate for func_02075394 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     blx-guard + store-order init (TRUNCATED asm)
 *   risk:       asm truncated — tail unverifiable; allocator is indirect blx not a named call; alloc helper name unknown
 *   confidence: low
 */
/* WARNING: source `asm` was TRUNCATED in the batch (only ~first 2/3 of the
   352-byte body present). The store offsets/constants below cover the
   visible prefix; the tail (further func_02076434/func_02094688 calls) is
   reconstructed by pattern and is NOT byte-verified. Treat as scaffold. */
extern unsigned char data_0219eee0;
extern unsigned char data_0219ef0c;
extern void func_020705d4(void);
extern void func_02075d44(void);
extern void func_02075df4(void);
extern void func_0207634c(void);
extern void func_02076434(void *o, void *dst, int z);
extern void func_02094688(void *dst, void *src, int n);
extern void func_020945f4(void *dst, int v, int n);

extern void (*const data_glob_02075394)(int);   /* _LIT0 -> indirect blx target */

struct Cfg02075394 {
    char pad_c[0xc];
    void *obj;                      /* +0xc */
};

int func_02075394(struct Cfg02075394 *p)
{
    char *o = (char *)p->obj;
    unsigned char *b;

    b = (unsigned char *)data_glob_02075394_alloc(0x83);   /* blx allocator */
    if (b == 0) {
        *(unsigned char *)(o + 0x455) = 9;
        return 0;
    }

    b[0]  = 0x14;
    b[1]  = 0x3;
    b[2]  = 0;
    b[3]  = 0;
    b[4]  = 1;
    b[5]  = 1;
    func_020945f4(o + 0x1cc, 0, 8);
    b[6]  = 0x16;
    b[7]  = 0x3;
    b[8]  = 0;
    b[9]  = 0;
    b[0xa] = 0x28;
    b[0xb] = 0x14;
    b[0xc] = 0;
    b[0xd] = 0;
    b[0xe] = 0x24;
    func_02094688(o + 0x3a4, o + 0x3fc, 0x58);
    func_02076434(o, b + 0xf, 0);
    func_02094688(o + 0x3fc, o + 0x3a4, 0x58);
    func_02094688(o + 0x2ec, o + 0x348, 0x5c);
    func_02076434(o, b + 0x1f, 0);
    /* ...truncated tail not reproduced... */
    return 1;
}
