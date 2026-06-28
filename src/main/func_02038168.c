/* CAMPAIGN-PREP candidate for func_02038168 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guarded resolve; 4-bit field test; setter; conditional tail call
 *   risk:       v preserved in r4 across call follows from callee-saved param; field offsets guessed; strh r4 implies v stored as-is (int param)
 *   confidence: med
 */
/* func_02038168: resolve id via func_02037b58, validate a 4-bit field,
 * write arg, optionally notify, return 1/0.
 *
 *   e = func_02037b58(id); if (!e) return 0;
 *   if (((e->f34 >> 20) & 0xf) != 1) return 0;
 *   e->f1a = (u16)v;
 *   if (!(e->f68 & 0x6000)) func_02087d2c(&e->f04, v);
 *   return 1;
 */

typedef struct Entry68 {
    char           _pad_00[0x04];
    char           f04;   /* +0x04, &e->f04 passed */
    char           _pad_05[0x1a - 0x5];
    unsigned short f1a;   /* +0x1a */
    char           _pad_1c[0x34 - 0x1c];
    unsigned int   f34;   /* +0x34 */
    char           _pad_38[0x68 - 0x38];
    unsigned short f68;   /* +0x68 */
} Entry68;

extern Entry68 *func_02037b58(int id);
extern void func_02087d2c(void *p, int v);

int func_02038168(int id, int v) {
    Entry68 *e = func_02037b58(id);

    if (e == 0) return 0;
    if (((e->f34 >> 20) & 0xf) != 1) return 0;

    e->f1a = (unsigned short)v;
    if (!(e->f68 & 0x6000)) {
        func_02087d2c(&e->f04, v);
    }
    return 1;
}
