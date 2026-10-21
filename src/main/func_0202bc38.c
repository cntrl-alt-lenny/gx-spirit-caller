extern unsigned short func_0202b0b4(int id);
extern unsigned char data_02105eb8[];

void func_0202bc38(int id, int bit, int enabled) {
    int index = func_0202b0b4(id);
    unsigned int mask = 1U << bit;
    if (enabled) {
        data_02105eb8[index] |= mask;
    } else {
        data_02105eb8[index] &= ~mask;
    }
}
