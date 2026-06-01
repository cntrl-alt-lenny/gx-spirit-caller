/* func_ov002_022163f4: bail if 021bb068(0x12FB) is positive, else run
 * 0220e650(arg0). */
extern int func_ov002_021bb068(int code);
extern void func_ov002_0220e650(void *arg0);

int func_ov002_022163f4(void *arg0) {
    if (func_ov002_021bb068(0x12FB) > 0)
        return 0;
    func_ov002_0220e650(arg0);
    return 0;
}
