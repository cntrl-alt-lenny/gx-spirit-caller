typedef struct Obj02031d0c Obj02031d0c;
/* This caller passes three arguments; the existing dispatcher definition names only the first. */
extern int func_02031d80(int arg, int flags, int priority);
extern void func_02034754(void *self, int n);
extern void func_02031d0c(Obj02031d0c *node);
extern unsigned long long func_02031c1c(void *node, int flags, int priority, void (*update)(char *), void (*destroy)(void));
extern void func_ov004_021d5b14(char *self);
extern void func_ov004_021d5b9c(void);
extern int func_ov004_021d5bdc(void *self);

unsigned long long func_ov004_021d5ce4(void) {
    void *node;
    unsigned long long result;
    node = (void *)func_02031d80(0x4138, 0, 0x7000000);
    if (node != 0) {
        func_02034754(node, 0x4138);
        result = func_02031c1c(node, 0, 0x7000000, func_ov004_021d5b14, func_ov004_021d5b9c);
        if (result == 0 || func_ov004_021d5bdc(node) < 0) {
            func_02031d0c(node);
            result = 0;
        }
    } else {
        result = 0;
    }
    return result;
}

