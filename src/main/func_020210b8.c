/* CAMPAIGN-PREP candidate for func_020210b8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Counted struct-stride loop (0x218+0x400) + guard call + teardown + Fill32
 *   risk:       stride 0x618 must emit as add #0x218 then add #0x400 (not one add) - the struct-size form usually does; field +4 offset assumed.
 *   confidence: high
 */
/* func_020210b8: walk 8 records (stride 0x618), call a handler when field +4
 * is set, then two teardown calls and a Fill32.
 *   e = data_02194374;
 *   for (i=0;i<8;i++){ if (e->f4) func_020212cc(e); e = (char*)e + 0x218 + 0x400; }
 *   func_02023188(); func_02021bac();
 *   Fill32(0, data_02194340, 0x30f4);
 *   return 1;
 * (add r0,r6,#0x218; add r6,r0,#0x400  => stride 0x618)
 */

extern void Fill32(int value, void *dst, unsigned int size);
extern int  data_02194340[];
extern void func_020212cc(void *p);
extern void func_02021bac(void);
extern void func_02023188(void);

typedef struct {
    int  f0;
    int  f4;
    char pad[0x618 - 8];
} Entry020210b8;

extern Entry020210b8 data_02194374[];

int func_020210b8(void) {
    int *fillbase = data_02194340;
    int i;
    Entry020210b8 *e = data_02194374;
    for (i = 0; i < 8; i++) {
        if (e->f4 != 0) {
            func_020212cc(e);
        }
        e++;
    }
    func_02023188();
    func_02021bac();
    Fill32(0, fillbase, 0x30f4);
    return 1;
}
