/* func_02006194: bit 0 of `data_02103d74[0x28]`. Sibling of func_02006164. */

typedef struct {
    char         _pad_0x00[0x28];
    unsigned int bit_0 : 1;
    unsigned int _hi   : 31;
} state_28_t;

extern state_28_t data_02103d74;

unsigned int func_02006194(void) {
    return data_02103d74.bit_0;
}
