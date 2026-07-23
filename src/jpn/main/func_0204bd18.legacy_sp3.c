typedef struct Ctx_0204bd8c {
    char pad0[4];
    int **field4;
    char pad1[0x1a0 - 8];
    unsigned char byte_1a0;
} Ctx_0204bd8c;

extern Ctx_0204bd8c *func_0204987c(void);
extern void func_020624bc(int *p);

void func_0204bd18(void) {
    func_0204987c()->byte_1a0 = 2;
    func_020624bc(*func_0204987c()->field4);
    func_0204987c()->byte_1a0 = 0;
}
