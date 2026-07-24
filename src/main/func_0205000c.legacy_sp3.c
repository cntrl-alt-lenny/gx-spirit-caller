typedef struct {
    unsigned char pad0[0x10];
    void *field_10;
    unsigned char field_14;
    unsigned char field_15;
    unsigned char field_16;
} Ctx_0205000c;

extern Ctx_0205000c *func_020498f0(void);
extern void func_020673dc(void *);

void func_0205000c(void) {
    if (func_020498f0()->field_15 == 2) {
        return;
    }
    func_020498f0()->field_14 = 0;
    func_020498f0()->field_16 = 0;
    func_020673dc(func_020498f0()->field_10);
}
