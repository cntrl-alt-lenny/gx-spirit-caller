extern void func_0207e1c4(int a, int b, int c, int d, int e);
extern void func_0207e0a8(void);
extern int func_0207df18(void);
extern void *func_0207df20(int size);
extern void *data_021020f4, *data_021020f8;
extern unsigned short data_021a08e0;
void func_0207e124(unsigned int slots, int callbacks)
{
    if (slots <= 2) func_0207e1c4(4,3,2,0,1);
    else func_0207e1c4(4,3,0,2,1);
    data_021a08e0 = slots;
    func_0207e0a8();
    if (callbacks) { data_021020f4 = (void *)func_0207df20; data_021020f8 = (void *)func_0207df18; }
}
