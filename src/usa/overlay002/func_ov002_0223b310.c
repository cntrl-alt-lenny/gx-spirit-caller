/* func_ov002_0223b310: for arg0 <= 0x14, report arg0 matches 0202b878(arg1);
 * else defer to 0202df78. */
extern int func_0202b824(int arg1);
extern int func_0202df24(void);

int func_ov002_0223b310(int arg0, int arg1) {
    if (arg0 <= 0x14)
        return arg0 == func_0202b824(arg1);
    return func_0202df24();
}
