/* func_0200a6e8: refresh two 8-word bitfield snapshots from
 * data_02104e6c (+0x1868 / +0x1888) via func_0200a46c, report whether the
 * first snapshot differs from what was previously stored, then commit the
 * fresh snapshots back and run the deferred-task drain func_0202aeec. */

extern void func_0202adc8(int flag);
extern void func_0200a46c(int *out1, int *out2);
extern void func_0202aeec(void);
extern void Copy32(void *src, void *dst, int n);

typedef struct {
    char _pad_00[0x14];
    unsigned int f_14 : 3;
    unsigned int      : 29;
} state_02104f3c_t;
extern state_02104f3c_t data_02104e5c;

extern unsigned int data_02104e6c[];

int func_0200a6e8(void) {
    int buf20[8];
    int buf0[8];
    unsigned int *g = data_02104e6c;
    int result = 0;
    int i;

    func_0202adc8(data_02104e5c.f_14);
    func_0200a46c(buf20, buf0);

    for (i = 0; i < 8; i++) {
        if ((buf20[i] ^ (int)g[0x61a + i]) != 0) {
            result = 1;
            break;
        }
    }

    Copy32(buf20, &g[0x61a], 0x20);
    Copy32(buf0, &g[0x622], 0x20);
    func_0202aeec();

    return result;
}
