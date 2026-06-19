/* func_ov019_021b2718: render the count a1 as a right-aligned number sprite into
 * the a0 buffer. Clear the 0x80-byte cell buffer, format a1 to a string
 * (func_02091554), and emit it via func_02004f3c — flagging the "ends in 1 but
 * not 1X" ordinal case (a1/10==1 || a1%10==1) — then blit the buffer out.
 */

extern void func_02094410(int a, void *b, int c);
extern void func_02091554(void *a, void *b, int c);
extern void func_02001cec(void *a, int b, int c);
extern void func_02004f3c(void *a, void *b, void *c, int d, int e, int f);
extern void func_0209445c(void *a, int b, int c);
extern char data_ov019_021b5ac8[];
extern char data_02102bb0[];

void func_ov019_021b2718(int a0, int a1) {
    char buf[0x80];
    char tmp[8];
    int flag = 0;
    func_02094410(0, buf, 0x80);
    if (a1 / 10 == 1 || a1 % 10 == 1) {
        flag = 1;
    }
    func_02091554(tmp, data_ov019_021b5ac8, a1);
    func_02001cec(data_02102bb0, 2, 2);
    func_02004f3c(data_02102bb0, tmp, buf, flag, 2, 0xa);
    func_0209445c(buf, a0, 0x80);
}
