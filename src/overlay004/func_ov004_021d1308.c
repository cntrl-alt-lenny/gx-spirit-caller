extern int func_0201cd1c(int a0, unsigned short *a1, int a2);
extern int func_02037208(int a0, int a1, int a2, int a3);
struct State { char pad[0xc6c]; int active; char pad2[0x10]; int selection; };
extern struct State data_ov004_0220e500;
extern int data_ov004_0220f168;
void func_ov004_021d1308(void) {
    unsigned short buf[2];
    unsigned int saved = (unsigned int)&data_ov004_0220f168;
    buf[0] = 14;
    *(int *)saved = data_ov004_0220e500.selection;
    buf[1] = *(int *)saved;
    func_0201cd1c(6, buf, 4);
    data_ov004_0220e500.active = 1;
    func_02037208(58, -1, 0, 1);
}
