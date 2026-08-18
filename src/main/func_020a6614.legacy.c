/* func_020a6614: IRQ-bracketed one-shot init. If data_021a9b08 is
 * unset, claim it as self, arm two sub-buffers via func_020a6600,
 * clear self->0xc0, register self via func_02091d24, then notify via
 * func_020919d8.
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_020a6600(void *a);
extern void func_02091d24(void *a, void (*cb)(void), void *b, void *c, int bufsize, int align);
extern void func_020919d8(void *self);
extern void func_020a6514(void);
extern void *data_021a9b08;
extern char data_021a9b0c[];
extern char data_021a9f30[];

void func_020a6614(void *self) {
    int saved = OS_DisableIrq();

    if (data_021a9b08 == 0) {
        data_021a9b08 = self;
        func_020a6600((char *)self + 0xc4);
        func_020a6600(data_021a9b0c);
        *(int *)((char *)self + 0xc0) = 0;
        func_02091d24(self, func_020a6514, self, data_021a9f30, 0x400, 0x14);
        func_020919d8(self);
    }
    OS_RestoreIrq(saved);
}
