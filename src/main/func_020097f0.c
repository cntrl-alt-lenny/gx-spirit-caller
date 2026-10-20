typedef struct {
    char pad[0x62];
    unsigned short value;
} State_020097f0;
typedef struct {
    char pad[0x938];
    unsigned int value;
} Work_020097f0;
extern State_020097f0 data_0210593c;
extern Work_020097f0 data_02104f3c;
extern int func_0201a3ec(void);
extern int func_0201a498(void);

unsigned int func_020097f0(void)
{
    unsigned int flags = 0;
    int i;
    int n;
    for (i = 0; i < 4; i++) {
        flags |= 1 << i;
    }
    n = data_0210593c.value;
    if (n > 28) n = 28;
    if (n % 2 != 0) n--;
    switch (n) {
    case 28: flags |= 0x2000000;
    case 26: flags |= 0x1000000;
    case 24: flags |= 0x800000;
    case 22: flags |= 0x400000;
    case 20: flags |= 0x200000;
    case 18: flags |= 0x80000;
    case 16: flags |= 0x20000;
    case 14: flags |= 0x4000;
    case 12: flags |= 0x1000;
    case 10: flags |= 0x400;
    case 8: flags |= 0x200;
    case 6: flags |= 0x100;
    case 4: flags |= 0x40;
    case 2: flags |= 0x10;
    }
    if (data_02104f3c.value >= 7) flags |= 0x80;
    if (data_02104f3c.value >= 24) flags |= 0x800;
    if (data_02104f3c.value >= 40) flags |= 0x40000;
    if (data_02104f3c.value >= 45) flags |= 0x100000;
    if (func_0201a3ec()) {
        if (data_02104f3c.value >= 11) flags |= 0x20;
        if (data_02104f3c.value >= 18) flags |= 0x8000;
    }
    if (func_0201a498()) {
        if (data_02104f3c.value >= 24) flags |= 0x2000;
        if (data_02104f3c.value >= 32) flags |= 0x10000;
    }
    return flags;
}
