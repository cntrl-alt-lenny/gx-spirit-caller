typedef struct {
    char pad[0x44];
    int f44;
    int f48;
} T_0204965c;

extern T_0204965c *data_0219dc80;

int func_0204965c(int a0, int a1) {
    if (data_0219dc80 == 0) {
        return 0;
    }
    data_0219dc80->f44 = a0;
    data_0219dc80->f48 = a1;
    return 1;
}
