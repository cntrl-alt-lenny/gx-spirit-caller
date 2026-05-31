/* func_ov002_021c031c: true iff func_ov002_021bff50(arg0) holds and the
 * opposite player's func_ov002_021c0258 is clear. */
extern int func_ov002_021bff50(int a);
extern int func_ov002_021c0258(int a);
int func_ov002_021c031c(int arg0) {
    if (func_ov002_021bff50(arg0) == 0)
        return 0;
    return func_ov002_021c0258(1 - arg0) == 0;
}
