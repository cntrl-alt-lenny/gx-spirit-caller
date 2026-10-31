struct Entry { unsigned short id; char rest[22]; };
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
extern int func_ov002_021b4b64(int a);
extern int func_ov002_0229cd70(int a, int b, int c);
#define CE288 (&data_ov002_022ce288)
int func_ov002_021e72a8(void) {
    unsigned int i;
    i = 0;
    CE288->f_480 = 0;
    for (; i < CE288->f_490; i++) {
        if (func_ov002_021b4b64(CE288->entries[i].id)) {
            func_ov002_0229cd70((int)&data_ov002_022ce588[CE288->f_480++], (int)&CE288->entries[i], 24);
            for (; i < CE288->f_490 - 1; i++) {
                func_ov002_0229cd70((int)&CE288->entries[i], (int)&CE288->entries[i + 1], 24);
            }
            CE288->f_490--;
            break;
        }
    }
    CE288->f_598 = CE288->f_480 > 0 ? 1 : 0;
    CE288->f_59c = 0;
    return 1;
}
