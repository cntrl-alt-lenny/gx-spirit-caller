extern char *GetSystemWork(void);
extern void func_02018a2c(void *p);
extern int func_0201b7e0(char *obj);
extern void func_020186c8(char *obj);
extern int func_0201b82c(char *obj);
extern int func_0201bbc8(char *obj);
extern int func_0201bd30(char *obj);

typedef struct {
    unsigned int lo8 : 8;
    unsigned int byteA : 8;
    unsigned int fieldB : 5;
    unsigned int rest : 11;
} Flags1c;

void func_0201bddc(char *self) {
    Flags1c *f;
    int a, b, c;

    func_02018a2c(GetSystemWork());
    (void)func_0201b7e0(self);

    *(int *)(self + 0x10) = 0;
    *(int *)(self + 0x8) = 0;
    *(int *)self = 0;

    f = (Flags1c *)(self + 0x1c);
    f->byteA = 0xff;
    f->fieldB = 0x1f;

    func_020186c8(self);

    if (*(int *)(self + 0x8) != 0) return;

    a = func_0201b82c(self);
    b = func_0201bbc8(self);
    a |= b;
    c = func_0201bd30(self);
    if ((a | c) == 0) {
        *(unsigned int *)(self + 0x18) |= 0x1000000;
    }
}
