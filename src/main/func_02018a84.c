typedef struct {
    char pad[0x4];
    unsigned int field4 : 3;
    unsigned int pad2 : 29;
} Data02104f4c_18a84;

extern Data02104f4c_18a84 data_02104f4c;
extern void func_0202ae1c(unsigned int);
extern void func_0202ba94(void *, void *);
extern void func_0202af40(void);

void func_02018a84(void *arg0, void *arg1) {
    func_0202ae1c(data_02104f4c.field4);
    func_0202ba94(arg0, arg1);
    func_0202af40();
}
