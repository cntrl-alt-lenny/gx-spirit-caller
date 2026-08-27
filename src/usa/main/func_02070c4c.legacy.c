/* func_02070c4c: guard on data_021a62f0's f_a4 object; dispatch to one of
 * two handlers based on its field_9 flag byte, tail-calling either and
 * returning its result. p==0 returns 1. */

typedef struct {
    unsigned char _pad_00[0x9];
    unsigned char field_9;
} Obj_02070d34_t;

typedef struct {
    unsigned char _pad_00[0xa4];
    Obj_02070d34_t *f_a4;
} Intermediate_02070d34_t;

typedef struct {
    unsigned char _pad_00[4];
    Intermediate_02070d34_t *ptr_4;
} Data_021a63d0_02070d34_t;

extern Data_021a63d0_02070d34_t data_021a62f0;
extern int func_02074b8c(Obj_02070d34_t *p);
extern int func_02070ca8(Obj_02070d34_t *p);

int func_02070c4c(void) {
    Obj_02070d34_t *p = data_021a62f0.ptr_4->f_a4;
    if (p == 0) {
        goto ret1;
    }
    if (p->field_9 == 0) {
        goto call2;
    }
    return func_02074b8c(p);
call2:
    return func_02070ca8(p);
ret1:
    return 1;
}
