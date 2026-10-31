typedef struct { int values[20]; } Table;
typedef struct { char pad[0x64]; int counter; int selector; } State;
extern Table data_020bea2c;
extern State data_0219ad48;
extern int func_0201d4b4(int sel);

void func_0202d1d8(int enabled) {
    Table table = data_020bea2c;
    int entry = table.values[(unsigned int)(data_0219ad48.counter / 4) % 20];
    unsigned short *dst = (unsigned short *)(func_0201d4b4(data_0219ad48.selector) + 0x4f6);
    int y, x;
    if (enabled == 0 || entry < 0) {
        for (y = 0; y < 3; y++) {
            for (x = 0; x < 5; x++) *dst++ = 0;
            dst += 27;
        }
    } else {
        enabled = entry * 15 + 0x290;
        for (y = 0; y < 3; y++) {
            for (x = 0; x < 5; x++) *dst++ = enabled++ | 0x4000;
            dst += 27;
        }
    }
}
