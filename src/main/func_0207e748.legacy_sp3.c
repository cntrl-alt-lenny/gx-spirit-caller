typedef struct { char pad[0xc]; unsigned short off,count; } Cont0207e7d8;
typedef struct { char pad[0xc]; int f_c; } state_c_t;
extern void *func_0207e7d8(Cont0207e7d8 *p, int key);
extern void func_0207e738(state_c_t *p);
int func_0207e748(Cont0207e7d8 *container, void **out)
{
    char *block = func_0207e7d8(container, 0x504c5454);
    if (!block) { *out=0; return 0; }
    func_0207e738((state_c_t *)(block+8));
    *out=block+8;
    return 1;
}
