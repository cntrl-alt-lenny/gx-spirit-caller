/* CAMPAIGN-PREP candidate for func_020206d8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard, store halfword, struct callback blx, reload field
 *   risk:       struct lacks f30 member referenced; base reloaded each ldr r0,_LIT0 (RELOAD recipe); callback arg order r0=data,r1=fc; offsets guessed
 *   confidence: low
 */
extern unsigned char data_020c67f8;
struct State {
    unsigned short f0;
    char pad2[0x6-0x2];
    unsigned short f6;   /* 0x6 */
    char pad8[0xc-0x8];
    unsigned short fc;   /* 0xc */
    char pad[0x38-0xe];
    void (*f38)(void *, unsigned int);
};
extern struct State data_02191f40;
extern void func_0201f138(int);
extern int func_02020738(unsigned int x);
extern void func_02093bfc(void);

int func_020206d8(void)
{
    if (data_02191f40.f30 != 7)
        func_02093bfc();
    func_0201f138(1);
    data_02191f40.fc = (unsigned short)func_02020738(data_02191f40.f6);
    if (data_02191f40.f38 != 0)
        data_02191f40.f38(&data_020c67f8, data_02191f40.fc);
    return data_02191f40.fc;
}
