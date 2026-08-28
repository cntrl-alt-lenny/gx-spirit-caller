/* func_02052dbc: zero b (12B), then either struct-copy a's sub-object
 * into b (fast path) or route b through func_02053640/func_0205358c.
 *
 * func_0205311c is a tail-call thunk to func_020531a0 elsewhere (its own
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

extern void func_02094500(void *ptr, int val, int count);
extern int func_0205311c(void *p);
extern void func_02053640(void *p, int value);
extern void func_0205358c(void *self, int flags);

void func_02052dbc(struct S02052e30 *a, struct S12_02052e30 *b) {
    func_02094500(b, 0, 0xc);
    if (func_0205311c(a) == 0) {
        *b = a->sub;
        return;
    }
    func_02053640(b, a->field_1c);
    func_0205358c(b, 3);
}
