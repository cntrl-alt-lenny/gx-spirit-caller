extern unsigned short data_ov002_022d1a9c;
extern int func_ov002_0225929c(int unused0);
extern int func_ov002_021b0f24(void);
extern unsigned int func_ov002_02259420(int, int, int);
extern void func_ov002_022a60f4(void *, int, int, int);

void func_ov002_022a82d4(char *obj, int reset) {
    int first;
    int side;
    int pass;
    int i;
    int count;
    int start;
    int mode;
    if (data_ov002_022d1a9c == 0) return;
    first = reset;
    mode = func_ov002_0225929c(data_ov002_022d1a9c);
    switch (mode) { case 2: case 3: return; }
    side = func_ov002_021b0f24();
    for (pass = 0; pass < 2; pass++) {
        if (reset) {
            *(unsigned int *)(obj + side * 4 + 0x588) = 0;
            for (i = 0; i < 15; i++) {
                if (i == 11) continue;
                if (func_ov002_02259420(side, i, 0) & ~2) {
                    *(unsigned int *)(obj + side * 4 + 0x588) |= 1 << i;
                    if (first) func_ov002_022a60f4(obj, side, i, 0);
                    first = 0;
                }
            }
        }
        *(unsigned int *)(obj + side * 4 + 0x588) &= 0xffff;
        count = *(int *)(obj + side * 0xcc + 0x484);
        if (count >= 8) count = 8;
        for (i = count - 1; i >= 0; i--) {
            start = *(int *)(obj + side * 0xcc + 0x488);
            if (func_ov002_02259420(side, 11, i + start)) {
                ((unsigned int *)obj)[side + 0x162] |= 1 << (i + 16);
                if (first) func_ov002_022a60f4(obj, side, 11, i + start);
                first = 0;
            }
        }
        side ^= 1;
    }
}


