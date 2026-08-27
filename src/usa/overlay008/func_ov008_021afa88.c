typedef struct {
    unsigned short field0;   /* 0x0 */
    unsigned short field2;   /* 0x2 */
    unsigned short field4;   /* 0x4 */
    char _pad6[0xbc - 0x6];
    int field_bc;             /* 0xbc */
    unsigned short *field_c0; /* 0xc0 */
} Obj;

extern Obj data_ov008_021b2cc4;
extern void func_ov008_021b21c0(int v);
extern void func_ov008_021b2144(int v, int flag);
extern void func_ov008_021b20dc(int v);

void func_ov008_021afa88(void) {
    int ip = data_ov008_021b2cc4.field4;

    if (ip == 0) {
        func_ov008_021b21c0(0);
        data_ov008_021b2cc4.field_bc = 0;
    } else {
        int sum = data_ov008_021b2cc4.field0 + data_ov008_021b2cc4.field2;
        unsigned short *p = data_ov008_021b2cc4.field_c0 + sum * 5 + ip;
        int v = p[-1];

        func_ov008_021b21c0(1);
        func_ov008_021b2144(v, 0);
    }

    func_ov008_021b20dc(data_ov008_021b2cc4.field_bc);
    data_ov008_021b2cc4.field_bc = 0;
}
