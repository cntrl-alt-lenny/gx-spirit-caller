typedef struct {
    char pad[0x4];
    unsigned int field4 : 3;
    unsigned int pad2 : 29;
} Data02104f4c_18a84;

extern Data02104f4c_18a84 data_02104e6c;
extern void func_0202adc8(unsigned int);
extern void func_0202ba40(void *, void *);
extern void func_0202aeec(void);

void func_02018a50(void *arg0, void *arg1) {
    func_0202adc8(data_02104e6c.field4);
    func_0202ba40(arg0, arg1);
    func_0202aeec();
}
