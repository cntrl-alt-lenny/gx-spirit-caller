/* func_020493bc: multi-stage duel/session housekeeping tick gated on the
 * data_0219dba0 global session pointer. Bails early (void) if the pointer
 * or its f_18 field is null, or if func_02045230() signals busy. Runs
 * func_02060d60() if either func_0204828c() or func_02060ebc() report
 * true (short-circuit OR). Then, if f_4 is set and *f_4 is set, calls
 * func_02048e90() (bailing early if it reports busy); if f_18/f_1e/f_8
 * pass a set of gating checks, optionally calls func_02048bf4(f_18,
 * f_14), then -- if f_1c < f_14 (signed) -- marks f_1e=3 and increments
 * f_1f. Finally, if f_1f (unsigned) < 2, returns; else clears f_1f and
 * calls func_02048bb4().
 *
 * Style B epilogue (pop {regs, pc}) + sub sp,#4 padding, no r3-spill ->
 * mwcc 1.2/sp3 (.legacy_sp3.c routing), not the default 2.0/sp1p5 tier
 * (see docs/research/sp3-routing-decision.md). */

typedef struct S02049430 {
    char _pad0[0x4];
    void *f_4;
    unsigned int f_8;
    char _pad1[0x8];
    int f_14;
    unsigned int f_18;
    unsigned char f_1c;
    char _pad2[1];
    unsigned char f_1e;
    unsigned char f_1f;
} S02049430;

extern S02049430 *data_0219dba0;
extern int func_02045230(void);
extern int func_0204828c(void);
extern int func_02060ebc(void);
extern void func_02060d60(void);
extern int func_02048e90(void);
extern void func_02048bf4(unsigned int, int);
extern void func_02048bb4(void);

void func_020493bc(void) {
    if (data_0219dba0 == 0) {
        return;
    }
    if (data_0219dba0->f_18 == 0) {
        return;
    }
    if (func_02045230() != 0) {
        return;
    }

    if (func_0204828c() != 0 || func_02060ebc() != 0) {
        func_02060d60();
    }

    if (data_0219dba0->f_4 != 0 && *(int *)data_0219dba0->f_4 != 0) {
        if (func_02048e90() != 0) {
            return;
        }
        if (data_0219dba0->f_18 != 0 && data_0219dba0->f_1e != 3 &&
            data_0219dba0->f_8 > 7) {
            if (data_0219dba0->f_1e <= 1) {
                func_02048bf4(data_0219dba0->f_18, data_0219dba0->f_14);
            }
            if (data_0219dba0->f_1c >= data_0219dba0->f_14) {
                data_0219dba0->f_1e = 3;
                data_0219dba0->f_1f += 1;
            }
        }
    }

    if ((unsigned int)data_0219dba0->f_1f < 2) {
        return;
    }
    data_0219dba0->f_1f = 0;
    func_02048bb4();
}
