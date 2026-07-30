/* func_ov002_022a80f0: spin up a func_02006bf0 task (id 4/0) from either
 * data_ov002_022cc238 or data_ov002_022cc254 depending on
 * func_ov002_022ae5dc's verdict on data_ov002_022d19bc, tag the outcome
 * into buf+0x10, then kick it via Task_Invoke. Lever check (brief:
 * hoist-vs-duplicate tail store): the call to func_02006bf0 takes a
 * DIFFERENT data pointer per arm (022cc32c vs 022cc348), so it cannot be
 * hoisted to a single post-if/else call site without changing the
 * function's shape -- both the call+r4-capture and the buf+0x10 store
 * stay duplicated per-arm here, matching ground truth exactly. Hoisting
 * either the whole call or just the store to run once after the if/else
 * was tried and does NOT byte-match (see brief report).
 */
typedef unsigned char  u8;
typedef unsigned short u16;

extern u16 data_ov002_022d19bc;
extern char data_ov002_022cc238[];
extern char data_ov002_022cc254[];

extern void func_0201d428(void *a);
extern int func_02006bf0(void *a, int b, int c);
extern void func_0201e564(void *a);
extern void Task_Invoke(int a);
extern int func_ov002_022ae5dc(unsigned short *p);

void func_ov002_022a80f0(void) {
    u8 buf[0x28];
    int h;

    func_0201d428(buf);
    if (func_ov002_022ae5dc(&data_ov002_022d19bc) != 0) {
        h = func_02006bf0(data_ov002_022cc238, 4, 0);
        *(short *)(buf + 0x10) = -1;
    } else {
        h = func_02006bf0(data_ov002_022cc254, 4, 0);
        *(short *)(buf + 0x10) = 0x60;
    }
    *(int *)(buf + 0x0) = h;
    *(u16 *)(buf + 0x14) = (*(u16 *)(buf + 0x14) & ~0xf) | 9;
    *(int *)(buf + 0xc) = 0xb980;
    func_0201e564(buf);
    Task_Invoke(h);
}
