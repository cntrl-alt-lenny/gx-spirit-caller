typedef struct {
    char pad[0x15];
    unsigned char field_15;
} Ctx_0204bf00;

extern Ctx_0204bf00 *func_0204987c(void);
extern void func_0204bd18(void);
extern void func_0204bed0(int);

void func_0204be8c(void) {
    if (func_0204987c()->field_15 == 2) {
        return;
    }
    if (func_0204987c()->field_15 == 3) {
        return;
    }
    func_0204bd18();
    func_0204bed0(1);
}
