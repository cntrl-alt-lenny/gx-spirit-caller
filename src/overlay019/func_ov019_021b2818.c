/* func_ov019_021b2818: render the count a1 as a right-aligned number sprite into
 * the a0 buffer. Clear the 0x80-byte cell buffer, format a1 to a string
 * (OS_SPrintf), and emit it via func_02004f58 — flagging the "ends in 1 but
 * not 1X" ordinal case (a1/10==1 || a1%10==1) — then blit the buffer out.
 */

extern void func_02094504(int a, void *b, int c);
extern void OS_SPrintf(void *a, void *b, int c);
extern void func_02001d0c(void *a, int b, int c);
extern void func_02004f58(void *a, void *b, void *c, int d, int e, int f);
extern void func_02094550(void *a, int b, int c);
extern char data_ov019_021b5bc8[];
extern char data_02102c90[];

void func_ov019_021b2818(int a0, int a1) {
    char buf[0x80];
    char tmp[8];
    int flag = 0;
    func_02094504(0, buf, 0x80);
    if (a1 / 10 == 1 || a1 % 10 == 1) {
        flag = 1;
    }
    OS_SPrintf(tmp, data_ov019_021b5bc8, a1);
    func_02001d0c(data_02102c90, 2, 2);
    func_02004f58(data_02102c90, tmp, buf, flag, 2, 0xa);
    func_02094550(buf, a0, 0x80);
}
