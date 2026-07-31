/* func_02063ae0: inserts value `c` into a sorted collection living at
 * a->field_5c (queried via func_02054140/func_020540d0), unless `c`
 * is already present (early success, *out=0) or the collection is
 * full relative to arg5 (early success, *out=1). After the actual
 * insert (func_02053f48 with func_02063c90 as a callback) and a
 * sanity recount, updates an auxiliary range at a->field_44 via
 * func_020613d8, then does extra bookkeeping via func_0206292c that
 * differs depending on whether the collection was empty beforehand.
 *
 * sp3 routing: clean 8-reg push {r4-r9,sl,lr} + sub sp,#0x10 in the
 * .s (no r3-spill), fused pop{regs,pc} epilogue -- the 1.2/sp3
 * signature per docs/research/style-a-epilogue.md, not the default
 * 2.0/sp1p5 tier.
 */

typedef struct {
    char pad_00[0x44];
    int field_44;
    char pad_48[0x04];
    int field_4c;
    char pad_50[0x0c];
    int field_5c;
    char pad_60[0x06];
    unsigned short field_66;
} Obj_02063ae0_t;

typedef struct {
    char pad_00[0x0c];
    unsigned short field_c;
} Elem_02063ae0_t;

extern int func_02053f48(int handle, void *info, void *cb);
extern Elem_02063ae0_t *func_020540d0(int handle, int index);
extern int func_02054140(int handle);
extern int func_020613d8(void *rangeptr, int d, int arg5);
extern int func_02061530(void *rangeptr);
extern int func_0206292c(Obj_02063ae0_t *a, unsigned short b, unsigned short c);
extern void func_02063c90(void);
extern int func_02064480(int a, int b);

int func_02063ae0(Obj_02063ae0_t *a, int b, int c, int d, int arg5, int *out) {
    int count = func_02054140(a->field_5c);
    int i;

    for (i = 0; i < count; i++) {
        Elem_02063ae0_t *p = func_020540d0(a->field_5c, i);

        if (p->field_c == c) {
            *out = 0;
            return 1;
        }
        if (func_02064480(p->field_c, c) > 0) {
            break;
        }
    }

    if (func_02061530(&a->field_44) < arg5) {
        *out = 1;
        return 1;
    }

    {
        struct {
            int field_0;
            int field_4;
            int field_8;
            unsigned short field_c;
        } local;

        local.field_0 = a->field_4c;
        local.field_4 = arg5;
        local.field_8 = b;
        local.field_c = (unsigned short) c;
        func_02053f48(a->field_5c, &local, func_02063c90);
    }

    if (count + 1 != func_02054140(a->field_5c)) {
        *out = 1;
        return 1;
    }

    func_020613d8(&a->field_44, d, arg5);

    if (count == 0) {
        if (func_0206292c(a, a->field_66, (unsigned short) (c - 1)) != 0) {
            goto fail_out0;
        }
        return 0;
    } else {
        Elem_02063ae0_t *p2;

        unsigned short tmp_field_c = func_020540d0(a->field_5c, count)->field_c;

        if (tmp_field_c != c) {
            goto fail_out0;
        }

        p2 = func_020540d0(a->field_5c, count - 1);

        if ((unsigned short) func_02064480(c, p2->field_c) <= 1) {
            goto fail_out0;
        }

        if (func_0206292c(a, (unsigned short) (p2->field_c + 1), (unsigned short) (c - 1)) == 0) {
            return 0;
        }
    }

fail_out0:
    *out = 0;
    return 1;
}
