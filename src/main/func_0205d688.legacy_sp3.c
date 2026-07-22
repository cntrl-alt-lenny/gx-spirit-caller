typedef struct {
    char pad[0x428];
    int field_428;
} T_0205d688;

extern int func_0205d6bc(T_0205d688 **p, int a1, int *out);
extern void func_020544c8(int a0, int a1);

void func_0205d688(T_0205d688 **p, int a1) {
    T_0205d688 *inner = *p;
    int local;
    if (func_0205d6bc(p, a1, &local) == 0) {
        return;
    }
    func_020544c8(inner->field_428, local);
}
