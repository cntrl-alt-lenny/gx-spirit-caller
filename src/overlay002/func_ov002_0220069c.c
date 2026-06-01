/* func_ov002_0220069c: bail if 021bb068(0x12FB) is positive, else forward to
 * 021ff400(arg0, arg1). */
extern int func_ov002_021bb068(int code);
extern int func_ov002_021ff400(void *arg0, int arg1);

int func_ov002_0220069c(void *arg0, int arg1) {
    if (func_ov002_021bb068(0x12FB) > 0)
        return 0;
    return func_ov002_021ff400(arg0, arg1);
}
