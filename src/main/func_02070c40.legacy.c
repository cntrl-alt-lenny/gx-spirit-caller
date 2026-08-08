/* func_02070c40: guard on data_021a63d0's f_a4 object; if field_9 is set,
 * run func_0207475c first, then always tail through func_02070c84. */

typedef struct {
    unsigned char _pad_00[0x9];
    unsigned char field_9;
} Obj_02070c40_t;

typedef struct {
    unsigned char _pad_00[0xa4];
    Obj_02070c40_t *f_a4;
} Intermediate_02070c40_t;

typedef struct {
    unsigned char _pad_00[4];
    Intermediate_02070c40_t *ptr_4;
} Data_021a63d0_02070c40_t;

extern Data_021a63d0_02070c40_t data_021a63d0;
extern void func_0207475c(Obj_02070c40_t *self);
extern void func_02070c84(Obj_02070c40_t *self);

void func_02070c40(void) {
    Obj_02070c40_t *r4 = data_021a63d0.ptr_4->f_a4;
    if (r4 == 0) {
        return;
    }
    if (r4->field_9 != 0) {
        func_0207475c(r4);
    }
    func_02070c84(r4);
}
