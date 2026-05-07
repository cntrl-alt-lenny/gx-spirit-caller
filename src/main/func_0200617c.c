/* func_0200617c: bit 2 of `data_02103d74[0x28]`. Sibling of func_02006164. */

typedef struct {
    char         _pad_0x00[0x28];
    unsigned int _pad_0_1 : 2;
    unsigned int bit_2    : 1;
    unsigned int _hi      : 29;
} state_28_t;

extern state_28_t data_02103d74;

unsigned int func_0200617c(void) {
    return data_02103d74.bit_2;
}
