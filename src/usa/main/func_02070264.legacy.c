/* func_02070264: guard chain on data_021a62f0's f_a4 object; if field_60
 * is set, run func_02070400 and clear it. */

typedef struct {
    unsigned char _pad_00[0x5c];
    int field_5c;
    int field_60;
} Obj_0207034c_t;

typedef struct {
    unsigned char _pad_00[0xa4];
    Obj_0207034c_t *f_a4;
} Intermediate_0207034c_t;

typedef struct {
    unsigned char _pad_00[4];
    Intermediate_0207034c_t *ptr_4;
} Data_021a63d0_0207034c_t;

extern Data_021a63d0_0207034c_t data_021a62f0;
extern int func_02070400(int a, int b, int c, int d);

void func_02070264(void) {
    Obj_0207034c_t *r4 = data_021a62f0.ptr_4->f_a4;
    if (r4 == 0) {
        return;
    }
    if (r4->field_60 == 0) {
        return;
    }
    func_02070400(r4->field_5c, r4->field_60, 0, 0);
    r4->field_60 = 0;
}
