/* CAMPAIGN-PREP candidate for func_02021064 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Counted struct-stride loop (0x218+0x400) + guard call + teardown + Fill32
 *   risk:       stride 0x618 must emit as add #0x218 then add #0x400 (not one add) - the struct-size form usually does; field +4 offset assumed.
 *   confidence: high
 */
/* func_02021064: walk 8 records (stride 0x618), call a handler when field +4
 * is set, then two teardown calls and a Fill32.
 *   e = data_02194294;
 *   for (i=0;i<8;i++){ if (e->f4) func_02021278(e); e = (char*)e + 0x218 + 0x400; }
 *   func_02023134(); func_02021b58();
 *   Fill32(0, data_02194260, 0x30f4);
 *   return 1;
 * (add r0,r6,#0x218; add r6,r0,#0x400  => stride 0x618)
 */

extern void Fill32(int value, void *dst, unsigned int size);
extern int  data_02194260[];
extern void func_02021278(void *p);
extern void func_02021b58(void);
extern void func_02023134(void);

typedef struct {
    int  f0;
    int  f4;
    char pad[0x618 - 8];
} Entry020210b8;

extern Entry020210b8 data_02194294[];

int func_02021064(void) {
    int *fillbase = data_02194260;
    int i;
    Entry020210b8 *e = data_02194294;
    for (i = 0; i < 8; i++) {
        if (e->f4 != 0) {
            func_02021278(e);
        }
        e++;
    }
    func_02023134();
    func_02021b58();
    Fill32(0, fillbase, 0x30f4);
    return 1;
}
