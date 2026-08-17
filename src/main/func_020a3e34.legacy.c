/* func_020a3e34: IRQ-bracketed slot arm. Bail 0 if data_021a98f8's
 * ready-flag(+0x50d) is set, or if func_020a3ed8 rejects the request;
 * otherwise stamp the slot fields and return 1.
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern char *data_021a98f8;
extern int  func_020a3ed8(int a, int b, int c);

int func_020a3e34(int arg0, int arg1) {
    int saved = OS_DisableIrq();

    if (((unsigned char *)data_021a98f8)[0x50d] != 0) {
        OS_RestoreIrq(saved);
        return 0;
    }
    if (func_020a3ed8(arg0, 8, arg1) == 0) {
        OS_RestoreIrq(saved);
        return 0;
    }
    *(unsigned short *)(data_021a98f8 + 0x10) = (unsigned short)arg1;
    *(unsigned short *)(data_021a98f8 + 0x500) = (unsigned short)arg0;
    *(unsigned short *)(data_021a98f8 + 0x502) = 8;
    OS_RestoreIrq(saved);
    return 1;
}
