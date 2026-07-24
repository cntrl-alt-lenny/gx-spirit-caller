typedef struct {
    unsigned char pad[0x90];
    int field_90;
    int field_94;
} S_02062118;

extern int func_02062944(S_02062118 *, int);

int func_020620a4(S_02062118 *a0, int a1) {
    int delta;

    if (a0->field_90 == 0) {
        return 1;
    }
    delta = a1 - a0->field_94;
    if ((unsigned int)delta > 0x64 && func_02062944(a0, delta) == 0) {
        return 0;
    }
    return 1;
}
