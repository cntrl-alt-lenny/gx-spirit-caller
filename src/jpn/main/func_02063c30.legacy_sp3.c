typedef struct {
    char _pad0[0x66];
    unsigned short f_66;
} obj_t;

extern int func_02063d54(void *a0);
extern int func_02063d98(void *a0, int a2, int a3);
extern int func_02063e04(void *a0);
extern int func_02063e5c(void *a0, int a2, int a3);
extern int func_02063f70(void *a0, int a2, int a3);
extern int func_0206404c(void *a0, int a2, int a3);
extern int func_020640e4(void *a0, int a2, int a3);

int func_02063c30(void *a0, int a1, int a2, int a3) {
    ((obj_t *)a0)->f_66++;

    if (a1 == 0) {
        if (func_020640e4(a0, a2, a3) == 0) return 0;
    } else if (a1 == 1) {
        if (func_0206404c(a0, a2, a3) == 0) return 0;
    } else if (a1 == 2) {
        if (func_02063f70(a0, a2, a3) == 0) return 0;
    } else if (a1 == 3) {
        if (func_02063e5c(a0, a2, a3) == 0) return 0;
    } else if (a1 == 4) {
        if (func_02063e04(a0) == 0) return 0;
    } else if (a1 == 5) {
        if (func_02063d98(a0, a2, a3) == 0) return 0;
    } else if (a1 == 6) {
        if (func_02063d54(a0) == 0) return 0;
    }
    return 1;
}
