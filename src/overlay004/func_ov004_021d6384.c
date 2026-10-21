typedef struct {
    char pad[0x4c];
    int mode;
    char pad2[0x3c90];
    int result;
    char pad3;
    char name[47];
    unsigned short value0, value1;
} Data;
typedef struct {
    char pad[0xce4];
    unsigned char id;
    char pad2[0x33];
    int value;
} Input;
typedef struct {
    char pad[0xba4];
    int value0, value1;
} State;
extern Data data_ov004_0220b500;
extern Input data_ov004_0220e500;
extern char data_ov004_0220f1d4[];
extern unsigned char data_02104c78[];
extern char data_02104c7a[][26];
extern State data_021040ac;
extern void func_02094688(const void *src, void *dst, unsigned size);
extern char *func_020aadf8(char *dst, const char *src);
extern int func_02007218(void);
void func_ov004_021d6384(int index, char *src) {
    Data *base = &data_ov004_0220b500;
    func_02094688(src + 2, data_ov004_0220f1d4, 0x54);
    data_02104c78[index] = data_ov004_0220e500.id;
    data_021040ac.value1 = data_ov004_0220e500.value;
    data_021040ac.value0 = base->mode == 1 ? base->value1 : base->value0;
    func_020aadf8(data_02104c7a[index], base->name);
    base->result = func_02007218();
}
