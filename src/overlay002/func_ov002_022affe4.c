/* func_ov002_022affe4: set arg0->f_4=7, spin up a func_02006c0c(4,0) task
 * from data_ov002_022cc7b0, tag a 0x201e5b8 command record (kind 9 then
 * |0x10, tag 0x1400, flags 0x200) and kick it via Task_Invoke. Same
 * "spawn a game task" idiom as func_ov002_022a8530 / func_ov002_022a822c. */
typedef unsigned char  u8;
typedef unsigned short u16;

extern char data_ov002_022cc7b0[];
extern int func_02006c0c(void *a, int b, int c);
extern void func_0201d47c(void *a);
extern void func_0201e5b8(void *a);
extern void Task_Invoke(int a);

void func_ov002_022affe4(void *arg0) {
    u8 buf[0x28];
    int h;

    *(int *)((char *)arg0 + 4) = 7;
    h = func_02006c0c(data_ov002_022cc7b0, 4, 0);
    func_0201d47c(buf);
    *(u16 *)(buf + 0x14) = (*(u16 *)(buf + 0x14) & ~0xf) | 9;
    *(int *)(buf + 0x0) = h;
    *(int *)(buf + 0xc) = 0x1400;
    *(u16 *)(buf + 0x14) = *(u16 *)(buf + 0x14) | 0x10;
    *(u16 *)(buf + 0x10) = 0x200;
    func_0201e5b8(buf);
    Task_Invoke(h);
}
