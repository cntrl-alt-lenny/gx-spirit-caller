/* func_ov002_021bbc34: pattern 9 sibling — 3-arg counting loop, 11 iters. */
extern int func_ov002_021ba024(int self, int i, int arg2);

int func_ov002_021bbc34(int self, int arg2) {
    int i;
    int count = 0;
    for (i = 0; i <= 10; i++) {
        if (func_ov002_021ba024(self, i, arg2)) count++;
    }
    return count;
}
