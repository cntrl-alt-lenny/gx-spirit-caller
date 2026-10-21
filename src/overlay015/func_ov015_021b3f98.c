extern char data_ov015_021b5e28[];
extern char data_ov015_021b5e44[];
/* The original caller passes one argument; the C callee defines (void). */
extern int func_ov005_021ac9c8(int);
extern int func_020b3870(int, int);
extern void func_ov015_021b3520(void *, int);
extern int func_02037208(int, int, int, int);
void func_ov015_021b3f98(int arg, short *rect) {
    char *state = data_ov015_021b5e44;
    int height = func_ov005_021ac9c8(*(int *)(data_ov015_021b5e28 + 0x894));
    int index = 0;
    if (height > 0)
        index = func_020b3870(rect[1] - 0x24, height);
    if (*(int *)state != 2)
        return;
    if (rect[3] - rect[1] < height)
        return;
    if (index == *(int *)(state + 0x8dc)) {
        *(int *)(state + 0xa84) |= 8;
    } else {
        func_ov015_021b3520(state + 0x880, index);
        *(int *)(state + 4) = arg;
        func_02037208(0x38, -1, 0, 1);
    }
}

