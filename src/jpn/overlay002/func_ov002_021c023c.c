/* func_ov002_021c023c: true iff func_ov002_021bfe70(arg0) holds and the
 * opposite player's func_ov002_021c0178 is clear. */
extern int func_ov002_021bfe70(int a);
extern int func_ov002_021c0178(int a);
int func_ov002_021c023c(int arg0) {
    if (func_ov002_021bfe70(arg0) == 0)
        return 0;
    return func_ov002_021c0178(1 - arg0) == 0;
}
