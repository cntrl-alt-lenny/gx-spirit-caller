typedef struct {
    unsigned char pad0[0x10];
    void *field_10;
    unsigned char field_14;
    unsigned char field_15;
    unsigned char field_16;
} Ctx_0205000c;

extern Ctx_0205000c *func_0204987c(void);
extern void func_02067368(void *);

void func_0204ff98(void) {
    if (func_0204987c()->field_15 == 2) {
        return;
    }
    func_0204987c()->field_14 = 0;
    func_0204987c()->field_16 = 0;
    func_02067368(func_0204987c()->field_10);
}
