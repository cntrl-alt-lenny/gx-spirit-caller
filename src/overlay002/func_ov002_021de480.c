/* func_ov002_021de480: test bit (arg1 + arg0*16) in the mask returned by
 * func_ov002_021de41c(arg0^arg2, arg3, bit). */
extern int func_ov002_021de41c(int a, int b, int c);
int func_ov002_021de480(int arg0, int arg1, int arg2, int arg3) {
    int bit = 1 << (arg1 + arg0 * 16);
    return (func_ov002_021de41c(arg0 ^ arg2, arg3, bit) & bit) != 0;
}
