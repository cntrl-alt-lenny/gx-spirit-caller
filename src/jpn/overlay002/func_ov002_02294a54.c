/* func_ov002_02294a54: multi-helper-pre (brief 262). Inline unsigned
 * deref keeps (x<<19)>>19 as lsl;lsr (named temp folds it to and #mask).
 * invert-polarity for the shared return 0. */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern int func_ov002_02280594(int bit0, int f0, int z);
extern unsigned int *func_ov002_021afa94(void);
extern int func_0202b854(int x);
int func_ov002_02294a54(struct S *self) {
    if (func_ov002_02280594(self->bit0, self->f0, 0) >= 0) {
        return func_0202b854((*func_ov002_021afa94() << 19) >> 19) >= 5;
    }
    return 0;
}
