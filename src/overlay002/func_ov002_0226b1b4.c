/* func_ov002_0226b1b4: build a small u16 staging buffer on the stack --
 * buf[0]=arg1, then copy arg3 halfwords from arg2 into buf[1..arg3] -- and
 * submit it via the dispatcher func_ov002_0226ad24 with kind 0xf and count
 * arg3+1. buf is 0x10 bytes (8 u16) -> sub sp,#0x10. */
typedef unsigned short u16;
extern int func_ov002_0226ad24(int a, int b, void *p, int n);
void func_ov002_0226b1b4(int arg0, int arg1, const u16 *arg2, int arg3) {
    u16 buf[8];
    int i;
    buf[0] = (u16)arg1;
    for (i = 0; i < arg3; i++)
        buf[i + 1] = arg2[i];
    func_ov002_0226ad24(arg0, 0xf, buf, arg3 + 1);
}
