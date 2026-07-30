/* func_ov002_022afea8: set arg0->f_4=7, spin up a func_02006bf0(4,0) task
 * from data_ov002_022cc6bc, tag a 0x201e5b8 command record (kind 9 then
 * |0x10, tag 0x1400, flags 0x200) and kick it via Task_Invoke. Same
 * "spawn a game task" idiom as func_ov002_022a83f4 / func_ov002_022a80f0. */
typedef unsigned char  u8;
typedef unsigned short u16;

extern char data_ov002_022cc6bc[];
extern int func_02006bf0(void *a, int b, int c);
extern void func_0201d428(void *a);
extern void func_0201e564(void *a);
extern void Task_Invoke(int a);

void func_ov002_022afea8(void *arg0) {
    u8 buf[0x28];
    int h;

    *(int *)((char *)arg0 + 4) = 7;
    h = func_02006bf0(data_ov002_022cc6bc, 4, 0);
    func_0201d428(buf);
    *(u16 *)(buf + 0x14) = (*(u16 *)(buf + 0x14) & ~0xf) | 9;
    *(int *)(buf + 0x0) = h;
    *(int *)(buf + 0xc) = 0x1400;
    *(u16 *)(buf + 0x14) = *(u16 *)(buf + 0x14) | 0x10;
    *(u16 *)(buf + 0x10) = 0x200;
    func_0201e564(buf);
    Task_Invoke(h);
}
