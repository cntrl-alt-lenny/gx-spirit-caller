extern void *func_0209dca8(void);
extern int func_0209db88(int count, ...);
extern void func_020928cc(void *p, int size);
extern void func_020928e8(void *p, int size);
extern int func_0209dd30(int arg0, unsigned short count, int arg2, int arg3, ...); /* Callee copies trailing words; this caller supplies nine arguments. */

int func_0209f2a8(int a0, int a1, void *a2, unsigned int a3,
                   unsigned short a4, unsigned short a5, unsigned short a6)
{
    unsigned short ready = 1;
    int result;
    char *p;
    p = *(char **)((char *)func_0209dca8() + 4);
    result = func_0209db88(2, 9, 10);
    if (result != 0) return result;
    func_020928cc(p + 0x3c, 2);
    func_020928cc(p + 0x188, 2);
    if (*(unsigned short *)(p + 0x188) == 0) {
        func_020928cc(p + 0x182, 2);
        ready = *(unsigned short *)(p + 0x182);
        func_020928cc(p + 0x86, 2);
    }
    if (a2 == 0) return 6;
    if (ready == 0) return 7;
    func_020928cc(p + 0x7c, 2);
    if (a2 == *(void **)(p + 0x7c)) return 6;
    if (a3 > 0x200) return 6;
    if (a3 == 0) return 6;
    func_020928e8(a2, a3);
    result = func_0209dd30(15, 7, (int)a2, a3, a4, a5, a6, a0, a1);
    return result == 0 ? 2 : result;
}



