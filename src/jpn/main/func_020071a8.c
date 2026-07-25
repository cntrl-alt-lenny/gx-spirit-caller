extern unsigned int data_02104e3c;
extern unsigned int data_02104e3c_alias; /* same address, see symbols.txt */
extern void func_020068fc(void);
extern void func_02006a1c(void);
extern void func_020057c0(void);

struct s071c4 {
    char _pad[0x10];
    unsigned int f_10;
    int f_14;
};

void func_020071a8(void)
{
    struct s071c4 *p_test  = (struct s071c4 *)&data_02104e3c;
    struct s071c4 *p_store = (struct s071c4 *)&data_02104e3c_alias;
    unsigned int v = p_test->f_10;

    if (((v << 30) >> 31) == 0) return;
    func_020068fc();
    func_02006a1c();
    if (p_store->f_14 != 0) func_020057c0();
    p_store->f_10 &= ~2u;
    p_store->f_14 = 0;
}
