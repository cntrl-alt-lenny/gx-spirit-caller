/* func_ov016_021b5244: probe 14 stride-10 records starting at (base+10). */
struct Ov016Row { char data[10]; };
extern struct Ov016Row data_ov016_021b9184[];
extern int func_ov016_021b28f4(void *p);

int func_ov016_021b5244(void) {
    int i;
    for (i = 0; i < 14; i++) {
        if (func_ov016_021b28f4(&data_ov016_021b9184[i + 1]))
            return 1;
    }
    return 0;
}
