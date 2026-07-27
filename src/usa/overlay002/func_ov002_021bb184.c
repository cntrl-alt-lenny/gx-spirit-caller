extern int func_ov002_021bad9c(int a, int b, int c);
extern int func_ov002_021baf88(void);

int func_ov002_021bb184(int a0, int a1, int a2) {
    int sum;
    if (a2 == 0)
        goto zero_case;
    sum = 0;
    if ((a2 & 1) > 0)
        goto skip1;
    sum += func_ov002_021bad9c(a1, a0, sum - 1);
skip1:
    if ((a2 & 2) > 0)
        goto skip2;
    sum += func_ov002_021bad9c(1 - a1, a0, -1);
skip2:
    return sum;
zero_case:
    return func_ov002_021baf88();
}
