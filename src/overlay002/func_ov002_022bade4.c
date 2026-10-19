typedef struct { unsigned short index:1; unsigned short type:5; unsigned short sub:8; unsigned short rest:2; } Selection;
extern int func_020215d8(void *p);
extern int func_02022234(unsigned int idx, unsigned int v);
extern int func_0202224c(int idx);
extern int func_02037208(int a0, int r1, int r2, int r3);
int func_ov002_022bade4(char *self) {
    switch (*(int *)(self + 0xc60)) {
    case 0: {
        Selection selection = *(Selection *)(self + 0xc68);
        int found = 0;
        int i;
        Selection *other = (Selection *)(self + 0xc74);
        for (i = 0; i < 2; i++, other++) {
            if (((void **)(self + 0xd50))[i]) {
                if (selection.index == other->index && selection.type == other->type) {
                    found = 1;
                    break;
                }
            }
        }
        if (found) {
            int mask = i == 0 ? 1 : 2;
            func_02022234(0x14, mask | func_0202224c(0x14));
            *(int *)(self + 0xd58) = i;
            *(int *)(self + 0xd3c) = 1;
            *(int *)(self + 0xc60) = 1;
            *(int *)(self + 0xc64) = 0;
        }
        break;
    }
    case 1:
        if (*(int *)(self + 0xc64) == 0x18) func_02037208(0x44, -1, 0, 1);
        if (!func_020215d8(*(void **)(self + 0xd50 + *(int *)(self + 0xd58) * 4))) {
            *(int *)(self + 0xc60) = 2;
            *(int *)(self + 0xc64) = 0;
        }
        break;
    case 2:
        *(int *)(self + 0xd3c) = 0;
        *(int *)(self + 0xd44) = 0;
        *(int *)(self + 0xcf8) = 0;
        *(int *)(self + 0xcc8) = 0xc;
        *(int *)(self + 0xc54) = 0;
        return 0;
    }
    *(int *)(self + 0xc64) += 1;
    return 1;
}

