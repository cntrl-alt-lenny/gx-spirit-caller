extern void func_ov008_021ae3a0(int);
extern void func_ov008_021ac0b8(int a0, int a1, int a2);
extern void func_ov008_021abcdc(void);
struct State {
    char pad0[4];
    unsigned short f4 : 8;
    unsigned short f5 : 8;
    unsigned short f6 : 8;
    unsigned short f7 : 8;
    unsigned short f8;
    char pad1[10];
    int f14;
};
extern struct State data_ov008_021b2dc8;
extern char data_ov008_021b2780[];
void func_ov008_021ae674(void) {
    func_ov008_021ae3a0((signed char)data_ov008_021b2dc8.f8);
    if (data_ov008_021b2dc8.f8 != 0) {
        *(int *)(data_ov008_021b2780 + 0x634) = data_ov008_021b2dc8.f14;
        if ((signed char)data_ov008_021b2dc8.f8 > 0)
            data_ov008_021b2dc8.f8--;
        else if ((signed char)data_ov008_021b2dc8.f8 < 0)
            data_ov008_021b2dc8.f8++;
    }
    if (data_ov008_021b2dc8.f6 > 2)
        func_ov008_021ac0b8(data_ov008_021b2dc8.f4, data_ov008_021b2dc8.f6 - 2, 1);
    func_ov008_021abcdc();
}
