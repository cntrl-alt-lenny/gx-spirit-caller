/* func_ov002_021bcfe4: if player (arg0&1)'s row arg1 slot has a nonzero id,
 * fail (0); else return whether func_ov002_021bc288(arg0, arg1) reports ready.
 * Both args pass through to the callee (keeps r0/r1 reserved). */
struct slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021bc288(int a, int b);
int func_ov002_021bcfe4(int arg0, int arg1) {
    char *base = data_ov002_022cf16c + (arg0 & 1) * 0x868;
    if (((struct slot *)(base + arg1 * 20 + 48))->id != 0)
        return 0;
    return func_ov002_021bc288(arg0, arg1) != 0;
}
