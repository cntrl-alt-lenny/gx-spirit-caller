extern int func_ov021_021abb40(int *s);
extern long long func_020b3870(int a, int b);
typedef struct { char pad[0x58]; int *table; int count; int chosen[5]; } Obj;
int func_ov021_021aba18(int *s) {
    Obj *o = (Obj *)s;
    int i;
    int j;
    int duplicate;
    for (i = 0; i < 5; i++) {
        do {
            duplicate = 0;
            o->chosen[i] = o->table[(int)(func_020b3870(func_ov021_021abb40(s), o->count) >> 32)];
            for (j = 0; j < i; j++) {
                if (o->chosen[j] == o->chosen[i]) {
                    duplicate = 1;
                    break;
                }
            }
        } while (duplicate);
    }
    return 1;
}
