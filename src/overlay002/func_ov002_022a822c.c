/* func_ov002_022a822c: spin up a func_02006c0c task (id 4/0) from either
 * data_ov002_022cc32c or data_ov002_022cc348 depending on
 * func_ov002_022ae718's verdict on data_ov002_022d1a9c, tag the outcome
 * into buf+0x10, then kick it via Task_Invoke. Lever check (brief:
 * hoist-vs-duplicate tail store): the call to func_02006c0c takes a
 * DIFFERENT data pointer per arm (022cc32c vs 022cc348), so it cannot be
 * hoisted to a single post-if/else call site without changing the
 * function's shape -- both the call+r4-capture and the buf+0x10 store
 * stay duplicated per-arm here, matching ground truth exactly. Hoisting
 * either the whole call or just the store to run once after the if/else
 * was tried and does NOT byte-match (see brief report).
 */
typedef unsigned char  u8;
typedef unsigned short u16;

extern u16 data_ov002_022d1a9c;
extern char data_ov002_022cc32c[];
extern char data_ov002_022cc348[];

extern void func_0201d47c(void *a);
extern int func_02006c0c(void *a, int b, int c);
extern void func_0201e5b8(void *a);
extern void Task_Invoke(int a);
extern int func_ov002_022ae718(unsigned short *p);

void func_ov002_022a822c(void) {
    u8 buf[0x28];
    int h;

    func_0201d47c(buf);
    if (func_ov002_022ae718(&data_ov002_022d1a9c) != 0) {
        h = func_02006c0c(data_ov002_022cc32c, 4, 0);
        *(short *)(buf + 0x10) = -1;
    } else {
        h = func_02006c0c(data_ov002_022cc348, 4, 0);
        *(short *)(buf + 0x10) = 0x60;
    }
    *(int *)(buf + 0x0) = h;
    *(u16 *)(buf + 0x14) = (*(u16 *)(buf + 0x14) & ~0xf) | 9;
    *(int *)(buf + 0xc) = 0xb980;
    func_0201e5b8(buf);
    Task_Invoke(h);
}
