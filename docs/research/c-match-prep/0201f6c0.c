/* CAMPAIGN-PREP candidate for func_0201f6c0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard chain, struct callback blx, branch tails
 *   risk:       cb is loaded into r0 base then reloaded as arg via _LIT2; the ldr r1,[r0,#0x38] then ldr r0,_LIT2 ordering may differ; field offset 0x38 assumed
 *   confidence: med
 */
extern void (*data_020c6578)(void *);
extern unsigned char data_020c6578_obj;
struct State { char pad[0x38]; void (*cb)(void); };
extern struct State data_02191f40;
extern unsigned char data_021922e0[];
extern void func_0201f19c(void);
extern int func_0201f724(void);
extern void func_02020b84(void);
extern int func_020a05f8(void *p);

int func_0201f6c0(void)
{
    void (*cb)(void);
    if (func_020a05f8(data_021922e0) != 0) {
        func_0201f19c();
        return 0;
    }
    if (func_0201f724() != 0)
        return 1;
    cb = data_02191f40.cb;
    if (cb != 0)
        ((void (*)(void *))cb)(&data_020c6578_obj);
    func_02020b84();
    return 0;
}
