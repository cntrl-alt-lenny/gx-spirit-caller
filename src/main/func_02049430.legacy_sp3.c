/* func_02049430: multi-stage duel/session housekeeping tick gated on the
 * data_0219dc80 global session pointer. Bails early (void) if the pointer
 * or its f_18 field is null, or if func_02045280() signals busy. Runs
 * func_02060dd4() if either func_02048300() or func_02060f30() report
 * true (short-circuit OR). Then, if f_4 is set and *f_4 is set, calls
 * func_02048f04() (bailing early if it reports busy); if f_18/f_1e/f_8
 * pass a set of gating checks, optionally calls func_02048c68(f_18,
 * f_14), then -- if f_1c < f_14 (signed) -- marks f_1e=3 and increments
 * f_1f. Finally, if f_1f (unsigned) < 2, returns; else clears f_1f and
 * calls func_02048c28().
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

extern S02049430 *data_0219dc80;
extern int func_02045280(void);
extern int func_02048300(void);
extern int func_02060f30(void);
extern void func_02060dd4(void);
extern int func_02048f04(void);
extern void func_02048c68(unsigned int, int);
extern void func_02048c28(void);

void func_02049430(void) {
    if (data_0219dc80 == 0) {
        return;
    }
    if (data_0219dc80->f_18 == 0) {
        return;
    }
    if (func_02045280() != 0) {
        return;
    }

    if (func_02048300() != 0 || func_02060f30() != 0) {
        func_02060dd4();
    }

    if (data_0219dc80->f_4 != 0 && *(int *)data_0219dc80->f_4 != 0) {
        if (func_02048f04() != 0) {
            return;
        }
        if (data_0219dc80->f_18 != 0 && data_0219dc80->f_1e != 3 &&
            data_0219dc80->f_8 > 7) {
            if (data_0219dc80->f_1e <= 1) {
                func_02048c68(data_0219dc80->f_18, data_0219dc80->f_14);
            }
            if (data_0219dc80->f_1c >= data_0219dc80->f_14) {
                data_0219dc80->f_1e = 3;
                data_0219dc80->f_1f += 1;
            }
        }
    }

    if ((unsigned int)data_0219dc80->f_1f < 2) {
        return;
    }
    data_0219dc80->f_1f = 0;
    func_02048c28();
}
