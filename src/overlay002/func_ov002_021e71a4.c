struct Entry { char bytes[24]; };
struct State {
    struct Entry entries[48];
    int f_480;
    char pad484[12];
    unsigned int f_490;
    char pad494[260];
    int f_598;
    int f_59c;
};
extern struct State data_ov002_022ce288;
extern struct Entry data_ov002_022ce588[];
extern int func_ov002_0229cd70(int a, int b, int c);
#define CE288 (&data_ov002_022ce288)
int func_ov002_021e71a4(void) {
    int i, j;
    i = 0;
    CE288->f_480 = 0;
    for (; i < CE288->f_490; i++) {
        func_ov002_0229cd70((int)&data_ov002_022ce588[i], (int)&CE288->entries[i], 24);
        CE288->f_480++;
        if (CE288->f_480 >= 16) break;
    }
    if (i < CE288->f_490) {
        for (j = 0; j < CE288->f_490 - i; j++) {
            func_ov002_0229cd70((int)&CE288->entries[j], (int)&CE288->entries[i + j], 24);
        }
    }
    CE288->f_490 -= i;
    CE288->f_598 = CE288->f_480 > 0 ? 1 : 0;
    CE288->f_59c = 0;
    return 1;
}


