/* func_ov002_022094f0: gate cascade, all checks naturally predicate
 * (no plain branches in target -- every early-return is
 * cmp+movCC+ldmCCia).
 *  - FIELD_6(field_02) must == 0x12.
 *  - field_14 must be nonzero.
 *  - func_ov002_021c8940(data_ov002_022cd3f4.f0, .f1c) must == 0x12.
 *  - func_ov002_021ff3bc(p, q) must be nonzero.
 *  - cf17c[bit0] must be nonzero.
 *  - return func_ov002_021ff2b8(p, 1-bit0) != 0.
 */

#define FIELD_6(x) (((unsigned)((x) << 20)) >> 26)
#define BIT0(x)    (((unsigned)((x) << 31)) >> 31)

typedef struct {
    unsigned char  _pad_00[2];
    unsigned short field_02;
    unsigned char  _pad_04[0x10];
    unsigned int   field_14;
} obj_022094f0_t;

typedef struct {
    int f0;
    unsigned char _pad_04[0x1c - 4];
    int f1c;
} obj_022cd3f4_t;

extern obj_022cd3f4_t data_ov002_022cd3f4;
extern int data_ov002_022cf17c[];

extern int func_ov002_021c8940(int a, int b);
extern int func_ov002_021ff3bc(obj_022094f0_t *p, void *q);
extern int func_ov002_021ff2b8(obj_022094f0_t *p, int notbit0);

int func_ov002_022094f0(obj_022094f0_t *p, void *q) {
    if (FIELD_6(p->field_02) != 0x12) {
        return 0;
    }
    if (p->field_14 == 0) {
        return 0;
    }
    if (func_ov002_021c8940(data_ov002_022cd3f4.f0, data_ov002_022cd3f4.f1c) != 0x12) {
        return 0;
    }
    if (func_ov002_021ff3bc(p, q) == 0) {
        return 0;
    }
    if (*(int *)((char *)data_ov002_022cf17c + (BIT0(p->field_02) & 1) * 0x868) == 0) {
        return 0;
    }
    return func_ov002_021ff2b8(p, 1 - BIT0(p->field_02)) != 0;
}
