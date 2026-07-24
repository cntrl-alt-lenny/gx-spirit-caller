typedef struct {
    char pad[0x15];
    unsigned char field_15;
} Ctx_0204bf00;

extern Ctx_0204bf00 *func_020498f0(void);
extern void func_0204bd8c(void);
extern void func_0204bf44(int);

void func_0204bf00(void) {
    if (func_020498f0()->field_15 == 2) {
        return;
    }
    if (func_020498f0()->field_15 == 3) {
        return;
    }
    func_0204bd8c();
    func_0204bf44(1);
}
