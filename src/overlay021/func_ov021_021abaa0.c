extern int func_ov021_021abb40(int *s);
typedef struct { char pad[0x74]; int chosen[10]; } Obj;
int func_ov021_021abaa0(int *s) {
    Obj *o = (Obj *)s;
    int i;
    int j;
    int duplicate;
    int count;
    for (i = 0; i < 10; i++) {
        do {
            duplicate = 0;
            o->chosen[i] = func_ov021_021abb40(s) % 5;
            count = 0;
            for (j = 0; j < i; j++) {
                if (o->chosen[j] == o->chosen[i]) count++;
            }
            if (count >= 2) duplicate = 1;
        } while (duplicate);
    }
    return 1;
}
