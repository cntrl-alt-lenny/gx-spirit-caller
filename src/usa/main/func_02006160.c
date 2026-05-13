/* func_02006160: bit 2 of `data_02103c94[0x28]`. Sibling of func_02006148. */

typedef struct {
    char         _pad_0x00[0x28];
    unsigned int _pad_0_1 : 2;
    unsigned int bit_2    : 1;
    unsigned int _hi      : 29;
} state_28_t;

extern state_28_t data_02103c94;

unsigned int func_02006160(void) {
    return data_02103c94.bit_2;
}
