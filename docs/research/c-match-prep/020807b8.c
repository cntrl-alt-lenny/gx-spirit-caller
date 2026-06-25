/* CAMPAIGN-PREP candidate for func_020807b8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     stack-arg marshalling forwarder; pool addrs as args; passthrough r0-r3
 *   risk:       Literal-pool/store scheduling of ip/lr is mwcc's; arg4 passthrough type assumed int.
 *   confidence: med
 */
/* func_020807b8: forwarder. Passes r0-r3 through, plus 5th incoming
 * stack arg, three function addresses, and arg3 again, to func_020808b8. */

extern void func_020808b8(int a, int b, int c, int d, int e,
                          void *f, void *g, void *h, int i);
extern void func_02080f40(void);
extern void func_02080cdc(void);
extern void func_02080b04(void);

void func_020807b8(int a, int b, int c, int d, int e) {
    func_020808b8(a, b, c, d, e,
                  (void *)func_02080f40,
                  (void *)func_02080cdc,
                  (void *)func_02080b04,
                  c);
}
