typedef struct {
    char _pad0[0x66];
    unsigned short f_66;
} obj_t;

extern int func_02063dc8(void *a0);
extern int func_02063e0c(void *a0, int a2, int a3);
extern int func_02063e78(void *a0);
extern int func_02063ed0(void *a0, int a2, int a3);
extern int func_02063fe4(void *a0, int a2, int a3);
extern int func_020640c0(void *a0, int a2, int a3);
extern int func_02064158(void *a0, int a2, int a3);

int func_02063ca4(void *a0, int a1, int a2, int a3) {
    ((obj_t *)a0)->f_66++;

    if (a1 == 0) {
        if (func_02064158(a0, a2, a3) == 0) return 0;
    } else if (a1 == 1) {
        if (func_020640c0(a0, a2, a3) == 0) return 0;
    } else if (a1 == 2) {
        if (func_02063fe4(a0, a2, a3) == 0) return 0;
    } else if (a1 == 3) {
        if (func_02063ed0(a0, a2, a3) == 0) return 0;
    } else if (a1 == 4) {
        if (func_02063e78(a0) == 0) return 0;
    } else if (a1 == 5) {
        if (func_02063e0c(a0, a2, a3) == 0) return 0;
    } else if (a1 == 6) {
        if (func_02063dc8(a0) == 0) return 0;
    }
    return 1;
}
