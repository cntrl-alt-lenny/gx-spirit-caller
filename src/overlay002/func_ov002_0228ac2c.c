/* func_ov002_0228ac2c: frameless-leaf -> bit0 != (field20 & 0xff). */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
int func_ov002_0228ac2c(struct S *s) {
    return s->bit0 != (*(int *)((char *)s + 20) & 0xff);
}
