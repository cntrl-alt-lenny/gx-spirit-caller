typedef struct {
    int f_0;
    int f_4;
    int f_8;
} state_3vc_t;
extern void func_02068368(state_3vc_t *p);
extern void func_02055320();
extern int func_02054e8c(int unused0, int unused1, int unused2);
extern int data_0219e3f0;
void func_0206811c(char *o, int a, int b, int force, int c, int d) {
    if (force == 0 && data_0219e3f0 != 1) return;
    func_02055320();
    *(int *)(o + 0) = b;
    *(int *)(o + 4) = a;
    *(int *)(o + 0x40) = 0;
    *(int *)(o + 0x44) = c;
    *(int *)(o + 0x48) = d;
    *(int *)(o + 0x28) = 0;
    *(int *)(o + 0x20) = func_02054e8c(2, 2, 0);
    func_02068368((state_3vc_t *)(o + 0x14));
    func_02068368((state_3vc_t *)(o + 8));
}
