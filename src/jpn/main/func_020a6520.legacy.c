/* func_020a6520: IRQ-bracketed one-shot init. If data_021a9a28 is
 * unset, claim it as self, arm two sub-buffers via func_020a650c,
 * clear self->0xc0, register self via func_02091c3c, then notify via
 * func_020918f0.
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_020a650c(void *a);
extern void func_02091c3c(void *a, void (*cb)(void), void *b, void *c, int bufsize, int align);
extern void func_020918f0(void *self);
extern void func_020a6420(void);
extern void *data_021a9a28;
extern char data_021a9a2c[];
extern char data_021a9e50[];

void func_020a6520(void *self) {
    int saved = OS_DisableIrq();

    if (data_021a9a28 == 0) {
        data_021a9a28 = self;
        func_020a650c((char *)self + 0xc4);
        func_020a650c(data_021a9a2c);
        *(int *)((char *)self + 0xc0) = 0;
        func_02091c3c(self, func_020a6420, self, data_021a9e50, 0x400, 0x14);
        func_020918f0(self);
    }
    OS_RestoreIrq(saved);
}
