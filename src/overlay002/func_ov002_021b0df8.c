extern struct { int pad; int side; } data_ov002_022cd73c;
extern int func_0202df78(int a, int b);
extern int func_0202e2f8(int unused0);
extern void func_ov002_021b0b54(int id, int value);
extern int func_ov002_021b0bdc(void *self, int arg);
extern int func_ov002_021b9ecc(int side, int index);
extern int func_ov002_021bc288(int side, int index);
extern int func_ov002_021c8470(int a, int b);

void func_ov002_021b0df8(void) {
    int cards[5];
    int count = 0;
    int empty = 0;
    int i, j, k;
    int n, card;
    for (i = 0; i <= 4; i++) {
        int found = func_ov002_021b9ecc(data_ov002_022cd73c.side, i);
        if (found != 0) {
            cards[count++] = found;
            func_ov002_021b0bdc(0, func_ov002_021c8470(data_ov002_022cd73c.side, i));
        }
        if (func_ov002_021bc288(data_ov002_022cd73c.side ^ 1, i) == 0) empty++;
    }
    if (count >= 3) {
        for (i = 0; i <= count - 3; i++) {

            if (func_0202e2f8(cards[i]) == 0) {
                n = 0;
                for (j = i + 1; j < count; j++) {
                    if (func_0202df78(cards[i], cards[j]) != 0) n++;
                }
                if (n >= 2) func_ov002_021b0b54(0x3b, 1);
            }
        }
    }
    if (count == 5) func_ov002_021b0b54(0x3c, 1);
    if (empty == 5) func_ov002_021b0b54(0x3d, 1);
}




