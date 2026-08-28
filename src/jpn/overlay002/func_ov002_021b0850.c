#include "ov002_core.h"

extern struct { char _pad0[8]; int f8; } data_ov002_022cd65c;

struct Cd968Bit0 {
    char _pad[0x300];
    unsigned int b0 : 1;
};
extern struct Cd968Bit0 data_ov002_022cd888;

extern int data_ov002_022cd664[];

extern int func_ov002_0229cc44(void);
extern int func_ov002_021ae6c8(void);
extern int func_ov002_021b1174(void);
extern int func_ov002_0226a838(void);
extern int func_ov002_02279a94(void);
extern int func_ov002_021b133c(void);
extern int func_ov002_021e72b4(void);
extern int func_ov002_021b03e8(void);
extern void func_ov002_02269aa0(void);
extern void func_ov002_021b07c8(void);

/* func_ov002_021b0850: early-out gate (cd73c.f8==3 tail-calls cd54;
 * cd0c/e0/cd968-bit0 gate returns 1) followed by a 6-way "first nonzero
 * wins" probe chain (ae7a8/b1254/a928/9b84/b141c/e73a4), which latches
 * D016C->f_d14 with whether the whole chain failed. On success, one more
 * probe (b04c8) can still short-circuit to 1; otherwise dispatches on
 * the cd744 flag table (indexed by the cec value cached at entry). */
int func_ov002_021b0850(void) {
    int r;
    int cd73c_f8 = data_ov002_022cd65c.f8;
    int cec = D016C->f_cec;

    if (cd73c_f8 == 3) {
        return func_ov002_0229cc44();
    }

    if (D016C->f_d0c != 0) {
        if (data_ov002_022cd888.b0) {
            goto return_one;
        }
    }
    if (D016C->f_e0 != 0) {
        goto return_one;
    }
    goto chain;

return_one:
    return 1;

chain:
    r = func_ov002_021ae6c8();
    if (r == 0) r = func_ov002_021b1174();
    if (r == 0) r = func_ov002_0226a838();
    if (r == 0) r = func_ov002_02279a94();
    if (r == 0) r = func_ov002_021b133c();
    if (r == 0) r = func_ov002_021e72b4();

    D016C->f_d14 = (r == 0);
    if (r != 0) {
        return 0;
    }

    if (func_ov002_021b03e8() != 0) {
        return 1;
    }

    if (data_ov002_022cd664[cec] == 2) {
        func_ov002_02269aa0();
    } else {
        func_ov002_021b07c8();
    }
    return 0;
}
