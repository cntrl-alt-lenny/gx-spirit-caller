typedef struct {
    char pad0[0x14];
    int f_14;
    int f_18;
    char pad1[0x6c - 0x18 - 4];
    int f_6c;
} state_0202d194_t;

extern state_0202d194_t data_0219ac68;
extern int func_0201d4dc(int);
extern void func_02094410(int, int, int);

void func_0202d140(int a) {
    int r = func_0201d4dc(data_0219ac68.f_6c) + 0x4e0;
    func_02094410(0, r + 0x2000, 0x2d20);
    data_0219ac68.f_18 = a;
    data_0219ac68.f_14 = 1;
}
