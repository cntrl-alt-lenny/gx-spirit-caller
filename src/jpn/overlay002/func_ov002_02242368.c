/* func_ov002_02242368: jump-table dispatch on data_ov002_022ce1a8.field_5b8
 * (0 falls through into 2; 1,3 share a body; default returns 1).
 */

typedef struct {
    unsigned char _pad_000[0x5b8];
    int field_5b8;
} data_ce288_02242450_t;

typedef struct {
    unsigned char _pad_000[0xd70];
    int field_d70;
    int field_d74;
    int field_d78;
} data_d016c_02242450_t;

typedef struct {
    unsigned short field_00;
    unsigned short field_02;
} arg_02242450_t;

extern data_ce288_02242450_t data_ov002_022ce1a8;
extern data_d016c_02242450_t data_ov002_022d008c;

#define BIT0(x) (((unsigned)((x) << 31)) >> 31)

extern void func_ov002_0229ce00(void *buf, int a, int b);
extern void func_ov002_021ae320(int bit0, void *buf);
extern void func_ov002_022422f4(void);
extern int  func_ov002_022592c0(int bit0, int field00, void *fp);
extern int  func_ov002_0225930c(void);
extern void func_ov002_021d8680(int a, int b);
extern void func_ov002_0223d9e0(void *p, int packed);

int func_ov002_02242368(arg_02242450_t *p) {
    char local_buf[0x100];

    switch (data_ov002_022ce1a8.field_5b8) {
    case 0:
        func_ov002_0229ce00(local_buf, 0x9b, 2);
        func_ov002_021ae320(BIT0(p->field_02), local_buf);
        /* fall through */
    case 2:
        func_ov002_022592c0(BIT0(p->field_02), p->field_00, func_ov002_022422f4);
        data_ov002_022ce1a8.field_5b8++;
        return 0;

    case 1:
    case 3:
        if (func_ov002_0225930c() == 0) {
            goto L_ec;
        }
        {
            int d70 = data_ov002_022d008c.field_d70;
            int sum = data_ov002_022d008c.field_d74 + data_ov002_022d008c.field_d78;
            unsigned short packed;
            unsigned char d70_byte, sum_byte;

            func_ov002_021d8680(d70, sum);

            d70_byte = (unsigned char)d70;
            sum_byte = (unsigned char)sum;
            packed = d70_byte | (sum_byte << 8);
            func_ov002_0223d9e0(p, packed);
        }
        data_ov002_022ce1a8.field_5b8++;
        return 0;

L_ec:
        data_ov002_022ce1a8.field_5b8--;
        return 0;

    default:
        return 1;
    }
}
