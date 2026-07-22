typedef struct {
    char pad0[4];
    int field_4;
    char pad1[0x488 - 8];
    void (*callback)(void *, int, int, int);
    char pad2[0x494 - 0x488 - 4];
    int field_494;
} T_0206b7d8;

extern int func_0205407c(int a0, int *out);

void func_0206b7d8(T_0206b7d8 *p, int a1) {
    func_0205407c(p->field_4, &a1);
    p->callback(p, 0, a1, p->field_494);
}
