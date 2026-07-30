/* func_02061798: null-checked, reentrancy-guarded indirect dispatch.
 * self->f9c looked up via func_020540d0(self->f9c, arg1) to get a struct
 * whose first field is a callback; arg2/arg3 are zeroed together unless
 * both are already nonzero; self->f24 and self->f8->f1c are bumped as
 * busy/recursion counters around the callback call; on the way out, if
 * self->f8 is "active but idle" (f14!=0 && f1c==0), fire the teardown
 * func_02064aa0(self->f8). */

typedef struct {
    char _pad_14[0x14];
    int f14;              /* +0x14 */
    char _pad_18[0x1c - 0x18];
    int f1c;              /* +0x1c */
} SubObj02061798;

typedef struct Self02061798 Self02061798;
typedef void (*Cb02061798)(Self02061798 *, int, int, int, int);

struct Self02061798 {
    char _pad_08[0x8];
    SubObj02061798 *f8;    /* +0x8 */
    char _pad_24[0x24 - 0xc];
    int f24;                 /* +0x24 */
    char _pad_9c[0x9c - 0x28];
    void *f9c;                 /* +0x9c */
};

extern void func_020a6d54(const char *file, const char *msg, int zero, int line);
extern void *func_020540d0(void *p, int idx);
extern void func_02064aa0(SubObj02061798 *self);

extern char data_021014e4[];
extern char data_021014f4[];

int func_02061798(Self02061798 *self, int arg1, int arg2, int arg3, int arg4) {
    void *cb;

    if (self == 0) {
        func_020a6d54(data_021014f4, data_021014e4, 0, 0x12d);
    }
    if (self == 0) return 1;

    cb = func_020540d0(self->f9c, arg1);
    if (cb == 0) return 1;

    if (arg3 == 0) goto zero_both;
    if (arg2 != 0) goto keep_both;
zero_both:
    arg2 = 0;
    arg3 = 0;
keep_both:

    self->f24 += 1;
    self->f8->f1c += 1;

    (*(Cb02061798 *)cb)(self, arg1, arg2, arg3, arg4);

    self->f24 -= 1;
    self->f8->f1c -= 1;

    if (self->f8->f14 != 0 && self->f8->f1c == 0) {
        func_02064aa0(self->f8);
        return 0;
    }
    return 1;
}
