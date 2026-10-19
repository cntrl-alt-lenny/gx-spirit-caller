typedef struct { unsigned char pad[0xf4]; int values[32]; } Context;
extern void *func_020498f0(void);
extern int func_0204b134(int in, int flag);
extern int func_02046b3c(int a);
extern int func_0204ead0(int a, int b, int c, int d, int *e, int f);
/* The existing dispatcher is typed void, but both its targets return int
 * and this caller consumes that return while forwarding the previous r0. */
extern int func_0204d438();

int func_0204bc4c(int mask) {
    int other[32];
    int selected[32];
    int n_other = 0;
    int n_selected = 0;
    int i;
    for (i = 1; i <= *(unsigned char *)((char *)func_020498f0() + 0xd); i++) {
        if (mask & (1 << *(unsigned char *)((char *)func_020498f0() + i + 0x2d0))) {
            selected[n_selected] = ((Context *)func_020498f0())->values[i]; n_selected++;
        } else {
            other[n_other] = ((Context *)func_020498f0())->values[i]; n_other++;
        }
    }
    for (i = 0; i < n_selected; i++) {
        func_0204ead0(16, selected[i], 0, 0, other, n_other);
        if (func_0204d438() != 0) return 0;
    }
    *(unsigned char *)((char *)func_020498f0() + 0x1a8) = 2;
    for (i = 0; i < n_other; i++) {
        int slot = func_0204b134(other[i], 0);
        if (slot != 255) func_02046b3c(slot);
    }
    *(unsigned char *)((char *)func_020498f0() + 0x1a8) = 0;
    return 1;
}


