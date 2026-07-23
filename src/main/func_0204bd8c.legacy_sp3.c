typedef struct Ctx_0204bd8c {
    char pad0[4];
    int **field4;
    char pad1[0x1a8 - 8];
    unsigned char byte_1a8;
} Ctx_0204bd8c;

extern Ctx_0204bd8c *func_020498f0(void);
extern void func_02062530(int *p);

void func_0204bd8c(void) {
    func_020498f0()->byte_1a8 = 2;
    func_02062530(*func_020498f0()->field4);
    func_020498f0()->byte_1a8 = 0;
}
