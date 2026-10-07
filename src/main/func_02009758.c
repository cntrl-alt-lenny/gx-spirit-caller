typedef struct {
    char pad[0xa88];
    int dirty;
} State_02009758;

extern unsigned int data_021059b8[];
extern State_02009758 data_02104f3c;

void func_02009758(int n) {
    int idx = n / 32;
    int bit = n % 32;

    if (data_021059b8[idx] & (1 << bit)) {
        return;
    }
    data_021059b8[idx] |= 1 << bit;
    data_02104f3c.dirty = 1;
}
