typedef struct {
    unsigned char pad[0x88];
    int field_88;
} S_020620d8;

extern int func_02062aec(void *a0);

int func_020620d8(S_020620d8 *a0, int a1) {
    int delta;

    delta = a1 - a0->field_88;
    if ((unsigned int)delta > 0x7530 && func_02062aec(a0) == 0) {
        return 0;
    }
    return 1;
}
