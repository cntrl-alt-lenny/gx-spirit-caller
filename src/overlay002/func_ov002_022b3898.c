/* func_ov002_022b3898: gate on self->f0!=0. Then require the MAIN-region
 * data_021040ac.f_b88 be 1/2 (with f_b9c!=0) or exactly 3; else return.
 * On success: self->f68=1, forward to func_ov002_022b35d8, then fire a
 * fixed func_02037208 event. */
typedef struct {
    char _pad0[0xb88];
    int f_b88;
    char _pad1[0xb9c - 0xb88 - 4];
    int f_b9c;
} MainGameState;

extern MainGameState data_021040ac;
extern void func_ov002_022b35d8(void *self, int a, int b);
extern void func_02037208(int a, int b, int c, int d);

void func_ov002_022b3898(void *self) {
    int isOneOrTwo;
    int state;

    if (*(int *)self == 0)
        return;

    state = data_021040ac.f_b88;
    isOneOrTwo = 1;
    if (state != 1 && state != 2)
        isOneOrTwo = 0;

    if (!((isOneOrTwo && data_021040ac.f_b9c != 0) || state == 3))
        return;

    *(int *)((char *)self + 0x68) = 1;
    func_ov002_022b35d8(self, data_021040ac.f_b9c, 0);
    func_02037208(0x5e, -1, 0, 1);
}
