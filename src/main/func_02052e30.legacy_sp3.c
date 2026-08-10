/* func_02052e30: zero b (12B), then either struct-copy a's sub-object
 * into b (fast path) or route b through func_020536b4/func_02053600.
 *
 * func_02053190 is a tail-call thunk to func_020531a0 elsewhere (its own
 * file declares it void), but its compiled tail-branch leaves func_020531a0's
 * real return value in r0 for this caller to test -- declare it int-
 * returning here to capture that.
 */

struct S12_02052e30 {
    int w0, w1, w2;
};

struct S02052e30 {
    unsigned char pad_00[0x4];
    struct S12_02052e30 sub; /* 0x4 */
    unsigned char pad_10[0x1c - 0x10];
    int field_1c;             /* 0x1c */
};

extern void func_020945f4(void *ptr, int val, int count);
extern int func_02053190(void *p);
extern void func_020536b4(void *p, int value);
extern void func_02053600(void *self, int flags);

void func_02052e30(struct S02052e30 *a, struct S12_02052e30 *b) {
    func_020945f4(b, 0, 0xc);
    if (func_02053190(a) == 0) {
        *b = a->sub;
        return;
    }
    func_020536b4(b, a->field_1c);
    func_02053600(b, 3);
}
