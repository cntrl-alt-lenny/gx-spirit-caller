typedef struct {
    char pad0[8];
    unsigned short h8;
    unsigned short ha;
    unsigned short hc;
    char pad1[38];
    unsigned int seed;
} State;
extern State data_02191f40;
extern void func_0201f138(int index);
extern void func_0201f19c(int arg);
extern int func_02020550(int n);
extern void func_02093a20(unsigned char *out);

int func_02020490(void)
{
    unsigned short mac[3];
    int result;
    unsigned int seed;
    func_02093a20((unsigned char *)mac);
    seed = *(unsigned int *)0x027ffc3c;
    seed = mac[0] + seed + mac[1] + mac[2];
    data_02191f40.seed = seed * 0x10dcd + 0x3039;
    data_02191f40.hc = 0;
    data_02191f40.h8 = 0x65;
    func_0201f138(3);
    result = func_02020550(1);
    if (result == 0x18) {
        func_0201f19c(0x18);
        func_0201f138(9);
        return 0;
    }
    if (result == 2)
        return 1;
    func_0201f19c(result);
    func_0201f138(9);
    return 0;
}



