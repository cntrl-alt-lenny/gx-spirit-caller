/* func_02070400: dispatch on data_021a62f0.ptr_4->f_a4->field_08:
 *  10 -> func_02072e18(a,b,r4) if b!=0; func_02072e18(c,d,r4) if d!=0; result=b+d
 *  11 -> func_02072f58(a,b,r4) if b!=0; func_02072f58(c,d,r4) if d!=0; result=b+d
 *  else -> result = field_09 ? func_020746f8(a,b,c,d,r4) : func_020704ec(a,b,c,d,r4)
 * Then: if data_0219ede0 flag byte != 0, return 0; else return result.
 * NULL r4 also returns 0 (shared with the flag-byte early-out).
 *
 * Same data_021a62f0.ptr_4->f_a4 chain as func_02070e24/func_02070dc0.
 */

typedef struct {
    unsigned char _pad_00[8];
    unsigned char field_08;
    unsigned char field_09;
} obj_020704e8_t;

typedef struct {
    unsigned char    _pad_00[0xa4];
    obj_020704e8_t   *f_a4;
} intermediate_020704e8_t;

typedef struct {
    unsigned char             _pad_00[4];
    intermediate_020704e8_t  *ptr_4;
} data_021a63d0_t;

extern data_021a63d0_t data_021a62f0;
extern unsigned char data_0219ede0;

extern void func_02072e18(int x, int y, obj_020704e8_t *r4);
extern void func_02072f58(int x, int y, obj_020704e8_t *r4);
extern int  func_020746f8(int a, int b, int c, int d, obj_020704e8_t *r4);
extern int  func_020704ec(int a, int b, int c, int d, obj_020704e8_t *r4);

int func_02070400(int a, int b, int c, int d) {
    obj_020704e8_t *r4;
    int result;

    r4 = data_021a62f0.ptr_4->f_a4;
    if (r4 == 0) {
        goto ret0;
    }

    if (r4->field_08 == 10) {
        if (b != 0) {
            func_02072e18(a, b, r4);
        }
        if (d != 0) {
            func_02072e18(c, d, r4);
        }
        result = b + d;
    } else if (r4->field_08 == 11) {
        if (b != 0) {
            func_02072f58(a, b, r4);
        }
        if (d != 0) {
            func_02072f58(c, d, r4);
        }
        result = b + d;
    } else {
        if (r4->field_09 != 0) {
            result = func_020746f8(a, b, c, d, r4);
        } else {
            result = func_020704ec(a, b, c, d, r4);
        }
    }

    if (data_0219ede0 != 0) {
        goto ret0;
    }
    return result;

ret0:
    return 0;
}
