/* func_ov002_02294b64: multi-helper-pre (brief 262). Inline unsigned
 * deref keeps (x<<19)>>19 as lsl;lsr (named temp folds it to and #mask).
 * invert-polarity for the shared return 0. */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern int func_ov002_022806a4(int bit0, int f0, int z);
extern unsigned int *func_ov002_021afb74(void);
extern int func_0202b8a8(int x);
int func_ov002_02294b64(struct S *self) {
    if (func_ov002_022806a4(self->bit0, self->f0, 0) >= 0) {
        return func_0202b8a8((*func_ov002_021afb74() << 19) >> 19) >= 5;
    }
    return 0;
}
