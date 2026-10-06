typedef struct { char pad[0xc]; unsigned short off,count; } Cont0207e7d8;
extern void *func_0207e7d8(Cont0207e7d8 *p, int key);
extern void func_0207e3d4(void *bank);
int func_0207e54c(Cont0207e7d8 *container, void **out)
{
    char *block = func_0207e7d8(container, 0x41424e4b);
    if (!block) { *out=0; return 0; }
    func_0207e3d4(block+8);
    *out=block+8;
    return 1;
}
