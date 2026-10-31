extern char *GetSystemWork(void);
/* The forwarder preserves r0, which this caller consumes as a result. */
extern int func_020139b4(void);
extern unsigned int func_020195ec(void);
extern int func_0201969c(void);
extern void func_0201b7b4(void);
extern unsigned int func_0201b7e0(void *obj);
struct Bit0 { unsigned int b : 1; };
void func_020162d0(void *o) {
    char *w = GetSystemWork();
    if (((struct Bit0 *)(w + 0x8d8))->b == 0) return;
    switch (*(int *)(w + 0x920)) {
    case 1:
        switch (*(int *)(w + 0x924)) {
        case 1:
            *(int *)(w + 0x924) = 4;
        case 4:
            if (func_0201969c() != 1) break;
            if (func_020139b4() != 2) break;
            *(int *)((char *)o + 8) = 0x00190100;
            *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
            *(int *)(GetSystemWork() + 0x8f8) |= 0x1000;
            break;
        case 3:
            if (((struct Bit0 *)(w + 0x8e0))->b != 0) break;
            if (func_020195ec() == 0) {
                *(int *)((char *)o + 8) = 0x00190101;
                break;
            } else {
                *(int *)((char *)o + 8) = 0x00190102;
                break;
            }
        case 2:
            *(int *)((char *)o + 8) = 0x00190103;
            *(int *)(GetSystemWork() + 0x8f8) &= ~0x1000;
            break;
        }
        break;
    case 2:
        if (func_0201b7e0(o) != 4) return;
        *(int *)((char *)o + 8) = 0x00190200;
        *(int *)(w + 0x900) &= ~0x1000000;
        func_0201b7b4();
        return;
    }
}






