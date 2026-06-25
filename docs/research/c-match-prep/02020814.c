/* CAMPAIGN-PREP candidate for func_02020814 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     store-order field clears, moveq/movne boolean tail
 *   risk:       stores must emit in exact asm order (f10,f3c,f1c,f4,fa=1,f2c,fa0,fa4,f20); the shared r2=0 const reuse; offsets guessed
 *   confidence: med
 */
struct State {
    char pad0[0x4];
    unsigned short f4;   /* 0x4 */
    char pad6[0xa-0x6];
    unsigned short fa;   /* 0xa */
    char padc[0x10-0xc];
    int f10;             /* 0x10 */
    char pad14[0x1c-0x14];
    int f1c;             /* 0x1c */
    char pad20[0x20-0x20];
    int f20;             /* 0x20 */
    char pad24[0x2c-0x24];
    int f2c;             /* 0x2c */
    char pad30[0x3c-0x30];
    int f3c;             /* 0x3c */
    char pad40[0xa0-0x40];
    int fa0;             /* 0xa0 */
    unsigned short fa4;  /* 0xa4 */
};
extern struct State data_02191f40;
extern int func_02020880(void);

int func_02020814(void)
{
    data_02191f40.f10 = 0;
    data_02191f40.f3c = 0;
    data_02191f40.f1c = 0;
    data_02191f40.f4 = 0;
    data_02191f40.fa = 1;
    data_02191f40.f2c = 0;
    data_02191f40.fa0 = 0;
    data_02191f40.fa4 = 0;
    data_02191f40.f20 = 0;
    return func_02020880() != 0;
}
