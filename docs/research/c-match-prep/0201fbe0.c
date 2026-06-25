/* CAMPAIGN-PREP candidate for func_0201fbe0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard chain, nested guards, struct callback blx
 *   risk:       first ldrh is from r0 arg (p->f2) not the global; rest reload data_02191f40; offsets 0x18/0x38 guessed; callback reloads base into r0 for arg
 *   confidence: med
 */
extern void (*data_020c6670);
extern unsigned char data_020c6670_obj;
struct State {
    unsigned short f0;   /* 0x0 */
    unsigned short f2;   /* 0x2 */
    char pad4[0x18-0x4];
    int f18;             /* 0x18 */
    char pad1c[0x38-0x1c];
    void (*f38)(void *); /* 0x38 */
};
extern struct State data_02191f40;
extern void func_0201f138(int);
extern void func_0201f19c(void);
extern int func_0201fc6c(void);
extern int func_0201fd24(void);

void func_0201fbe0(struct State *p)
{
    if (p->f2 != 0) {
        func_0201f19c();
        return;
    }
    func_0201f138(1);
    if (data_02191f40.f0 == 0)
        return;
    if (data_02191f40.f18 != 0) {
        if (func_0201fc6c() != 0)
            return;
        func_0201f138(9);
        return;
    }
    if (func_0201fd24() != 0)
        return;
    if (data_02191f40.f38 != 0)
        data_02191f40.f38(&data_020c6670_obj);
    func_0201f138(9);
    return;
}
