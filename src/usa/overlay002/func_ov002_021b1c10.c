/* func_ov002_021b1c10: no args. flag = (D016C->f_d0c != 0 &&
 * data_ov002_022cd664[D016C->f_cec] == 2); return
 * (flag + data_ov002_022cd888's signed 4-bit field at +0x300 bit15) > 0. */
#include "ov002_core.h"
extern int data_ov002_022cd664[];

struct Cd968 {
    char _pad[0x300];
    unsigned int _r0 : 15;
    signed int field : 4;
    unsigned int _r1 : 13;
};
extern struct Cd968 data_ov002_022cd888;

int func_ov002_021b1c10(void) {
    int flag = 0;
    if (D016C->f_d0c != 0 && data_ov002_022cd664[D016C->f_cec] == 2) {
        flag = 1;
    }
    return (flag + data_ov002_022cd888.field) > 0;
}
