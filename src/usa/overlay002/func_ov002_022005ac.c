/* func_ov002_022005ac: bail if 021bb068(0x12FB) is positive, else forward to
 * 021ff400(arg0, arg1). */
extern int func_ov002_021baf88(int code);
extern int func_ov002_021ff310(void *arg0, int arg1);

int func_ov002_022005ac(void *arg0, int arg1) {
    if (func_ov002_021baf88(0x12FB) > 0)
        return 0;
    return func_ov002_021ff310(arg0, arg1);
}
