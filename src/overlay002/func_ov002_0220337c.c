/* func_ov002_0220337c: count mismatches of func_ov002_021bc55c(i,j) over the
 * 2x5 grid i=0..1, j=0..4; return whether more than one mismatched. */
extern int func_ov002_021bc55c(int i, int j);

int func_ov002_0220337c(void) {
    int i, j, count = 0;
    for (i = 0; i < 2; i++) {
        for (j = 0; j <= 4; j++) {
            if (func_ov002_021bc55c(i, j)) count++;
        }
    }
    return count > 1;
}
