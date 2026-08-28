/* func_0207d100: populate a record's first four fields from args (the
 * 5th, a byte, packed into the low byte of a bitfield word), then
 * apply it, lazily one-time-init a companion table, and finalize. */

extern void func_0207d0d0(void *a0, int a1);
extern int func_0207d18c(void *a0);
extern void func_0207d044(int a0, void *a1);

extern int data_021a07f0;
extern unsigned char data_021a07f4[];

union S0207d1e8_F20 {
    volatile int raw;
    struct {
        volatile unsigned int byte0 : 8;
        unsigned int rest : 24;
    } bits;
};

struct S0207d1e8_Obj {
    int f_0;    /* +0x0 */
    unsigned char _pad_4[0x18 - 0x4];
    int f_18;     /* +0x18 */
    int f_1c;       /* +0x1c */
    union S0207d1e8_F20 f_20;   /* +0x20 */
};

void func_0207d100(struct S0207d1e8_Obj *a0, int a1, int a2, int a3, unsigned short a4) {
    a0->f_0 = a1;
    a0->f_18 = a2;
    a0->f_1c = a3;
    a0->f_20.raw = 0;
    a0->f_20.bits.byte0 = 0;
    a0->f_20.raw |= (a4 & 0xff);

    func_0207d0d0((unsigned char *)a0 + 0xc, 4);

    if (data_021a07f0 == 0) {
        func_0207d0d0(data_021a07f4, 4);
        data_021a07f0 = 1;
    }

    func_0207d044(func_0207d18c(a0), a0);
}
