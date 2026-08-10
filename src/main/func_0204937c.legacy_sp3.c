/* func_0204937c: populate 6 fields of the global data_0219dc80 struct from
 * params 3-8 (params 1-2 unused), clear 4 flag bytes, set f_0=1, then bump
 * f_1f once conditionally (if f_18==0) and again unconditionally.
 *
 * Every access re-derives the global pointer fresh (two loads: address-of
 * data_0219dc80, then its value) instead of caching it in a register --
 * write each statement directly against the global name, no local copy.
 */

typedef struct {
    unsigned int f_0;
    char _pad4[0x14];
    unsigned int f_18;
    unsigned char f_1c;
    unsigned char f_1d;
    unsigned char f_1e;
    unsigned char f_1f;
    char _pad20[0xc];
    unsigned int f_2c;
    unsigned int f_30;
    unsigned int f_34;
    unsigned int f_38;
    unsigned int f_3c;
    unsigned int f_40;
} state_0204937c_t;

extern state_0204937c_t *data_0219dc80;

void func_0204937c(int unused0, int unused1, int p2, int p3, int p4, int p5, int p6, int p7) {
    data_0219dc80->f_2c = p2;
    data_0219dc80->f_30 = p3;
    data_0219dc80->f_34 = p4;
    data_0219dc80->f_38 = p5;
    data_0219dc80->f_3c = p6;
    data_0219dc80->f_40 = p7;
    data_0219dc80->f_1d = 0;
    data_0219dc80->f_1e = 0;
    data_0219dc80->f_1f = 0;
    data_0219dc80->f_1c = 0;
    data_0219dc80->f_0 = 1;
    if (data_0219dc80->f_18 == 0) {
        data_0219dc80->f_1f = data_0219dc80->f_1f + 1;
    }
    data_0219dc80->f_1f = data_0219dc80->f_1f + 1;
}
