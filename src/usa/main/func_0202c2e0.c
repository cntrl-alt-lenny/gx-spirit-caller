/* func_0202c2e0: early-out if a0<0 (after running func_0202c374's cleanup
 * unconditionally), else format a card value via two different templates
 * and post both handles into data_0219a85c.p1's first two slots. */
extern void func_0202c374(void);
extern void OS_SPrintf(char *buf, const char *fmt, ...);
extern int  func_02006bf0(char *s, int a, int b);
extern int  data_020be688[];
extern char data_020c6a3c[];
extern char data_020c6a50[];

typedef struct Slots0202c3c8 {
    int s0;            /* +0x0 */
    int s4;            /* +0x4 */
    int s8;            /* +0x8 */
} Slots0202c3c8;

typedef struct Ctx0202c3c8 {
    char            _pad_00[0x4];
    Slots0202c3c8  *p1;  /* +0x4 */
} Ctx0202c3c8;

extern Ctx0202c3c8 data_0219a85c;

void func_0202c2e0(int a0) {
    char buf[0x40];
    func_0202c374();
    if (a0 < 0) {
        return;
    }
    int v = data_020be688[a0];
    OS_SPrintf(buf + 0x20, data_020c6a3c, v);
    int h1 = func_02006bf0(buf + 0x20, 4, 0);
    data_0219a85c.p1->s0 = h1;
    OS_SPrintf(buf, data_020c6a50, v);
    int h2 = func_02006bf0(buf, 4, 0);
    data_0219a85c.p1->s4 = h2;
}
