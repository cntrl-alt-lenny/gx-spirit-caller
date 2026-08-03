/* func_ov002_0228b2b4: multi-stage gate.
 *  - if func_ov002_021ff1c8(1-bit0(p->f2)) != 3, return 0.
 *  - if func_ov002_021bbe70(1-bit0(p->f2)) == 0, return 1.
 *  - if q == NULL, return 0.
 *  - if bit0(q->f2) == bit0(p->f2), return 0.
 *  - if (unsigned char)q->f6 == 0, return 0.
 *  - val = func_ov002_0223dda4(q, 0); b1 = byte 1 of val;
 *    return (unsigned)b1 > 10;
 *
 * Bitfield extraction uses the original's exact shift-pair widths
 * (see docs/research/codegen-walls.md C-46 extension 2).
 */

#define BIT0(x)  (((unsigned)((x) << 31)) >> 31)
#define BYTE0(x) (((unsigned)((x) << 24)) >> 24)

typedef struct {
    unsigned char  _pad_00[2];
    unsigned short field_02;
    unsigned char  _pad_04[2];
    unsigned short field_06;
} obj_0228b3c4_t;

extern int func_ov002_021ff1c8(obj_0228b3c4_t *p, int notbit0);
extern int func_ov002_021bbe70(int notbit0);
extern int func_ov002_0223dda4(void *q, int zero);

int func_ov002_0228b2b4(obj_0228b3c4_t *p, obj_0228b3c4_t *q) {
    int val;
    unsigned short half;
    int b1;

    if (func_ov002_021ff1c8(p, 1 - BIT0(p->field_02)) != 3) {
        goto ret0;
    }

    if (func_ov002_021bbe70(1 - BIT0(p->field_02)) == 0) {
        return 1;
    }

    if (q == 0) {
        return 0;
    }

    if (BIT0(q->field_02) == BIT0(p->field_02)) {
        return 0;
    }

    if (!BYTE0(q->field_06)) {
        goto ret0;
    }

    val = func_ov002_0223dda4(q, 0);
    half = (unsigned short)val;
    b1 = (half >> 8) & 0xff;
    if ((unsigned)b1 > 10) {
        return 1;
    }

ret0:
    return 0;
}
