typedef struct { char pad[0xc]; unsigned short off,count; } Cont0207e7d8;
typedef struct { unsigned short count,flags; int entries; int unk8; int names; int unk10; int extra; } Bank;
extern void *func_0207e7d8(Cont0207e7d8 *p, int key);
extern void func_0207e594(Bank *bank);
int func_0207e664(Cont0207e7d8 *container, void **out)
{
    char *block = func_0207e7d8(container, 0x4345424b);
    if (!block) { *out=0; return 0; }
    func_0207e594((Bank *)(block+8));
    *out=block+8;
    return 1;
}
