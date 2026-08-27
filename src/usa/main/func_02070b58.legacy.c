/* func_02070b58: guard on data_021a62f0's f_a4 object; if field_9 is set,
 * run func_02074674 first, then always tail through func_02070b9c. */

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

extern Data_021a63d0_02070c40_t data_021a62f0;
extern void func_02074674(Obj_02070c40_t *self);
extern void func_02070b9c(Obj_02070c40_t *self);

void func_02070b58(void) {
    Obj_02070c40_t *r4 = data_021a62f0.ptr_4->f_a4;
    if (r4 == 0) {
        return;
    }
    if (r4->field_9 != 0) {
        func_02074674(r4);
    }
    func_02070b9c(r4);
}
