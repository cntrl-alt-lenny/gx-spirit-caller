/* func_ov002_02229d00: if the cf17c per-player slot is nonzero, notify
 * (0x21e2818/0x21d87dc), then dispatch on whether func_0202df78 accepts
 * the cf16c row's low-13-bit field + field_08, calling either
 * 0x21d8288 (accept) or 0x21e13f4 (reject).
 *
 * Bit/field extraction uses the original's exact shift-pair widths
 * (lsl #0x1f / lsr #0x1f for bit 0; lsl #0x13 / lsr #0x13 for the
 * low 13 bits) instead of a mask -- mwcc folds a plain `& MASK` into
 * a pool-constant AND, which doesn't match (see docs/research/
 * codegen-walls.md C-46 extension 2). Every *array-indexing* use of
 * the extracted bit additionally re-masks with `& 1` on top of the
 * shift-pair (matches target's extra `and` before each `mla`/`mul`);
 * plain call-argument uses of the same extraction do not re-mask.
 */
#include "ov002_core.h"

#define BIT0(x)  (((unsigned)((x) << 31)) >> 31)
#define LOW13(x) (((unsigned)((x) << 19)) >> 19)

extern int  func_0202df78(int a, int b);
extern void func_ov002_021d87dc(int bit);
extern void func_ov002_021e2818(int player);
extern void func_ov002_021d8288(int bit, void *addr);
extern void func_ov002_021e13f4(int bit, int b, int c);

typedef struct {
    unsigned char  _pad_00[2];
    unsigned short field_02;
    unsigned char  _pad_04[4];
    unsigned short field_08;
} arg_02229d00_t;

int func_ov002_02229d00(arg_02229d00_t *p) {
    if (*(int *)((char *)data_ov002_022cf17c + (BIT0(p->field_02) & 1) * 0x868) == 0) {
        goto done;
    }

    func_ov002_021e2818(BIT0(p->field_02));
    func_ov002_021d87dc(BIT0(p->field_02));

    if (func_0202df78(
            LOW13(*(int *)(data_ov002_022cf16c + (BIT0(p->field_02) & 1) * 0x868 + 0x260)),
            p->field_08) != 0) {
        func_ov002_021d8288(BIT0(p->field_02),
            data_ov002_022cf16c + (BIT0(p->field_02) & 1) * 0x868 + 0x260);
    } else {
        func_ov002_021e13f4(BIT0(p->field_02), 1, 0);
    }
done:
    return 0;
}
