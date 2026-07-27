/* func_ov002_022a8530: sprintf a fixed string, spin up a func_02006c0c(4,0)
 * task from it, tag a 0x201e5b8 command record (kind 9, tag 0xc980,
 * flags -1) and kick it via Task_Invoke. Matches the established
 * "spawn a game task" idiom used by func_ov002_022a822c.c and the
 * ov006 021c1*.c family (buf[0x28] cmd record, u16 kind-nibble patch). */
typedef unsigned char  u8;
typedef unsigned short u16;

extern char data_ov002_022cc364[];
extern void OS_SPrintf(void *out, void *fmt);
extern int func_02006c0c(void *a, int b, int c);
extern void func_0201d47c(void *a);
extern void func_0201e5b8(void *a);
extern void Task_Invoke(int a);

void func_ov002_022a8530(void) {
    char sprintf_buf[0x20];
    u8 buf[0x28];
    int h;

    OS_SPrintf(sprintf_buf, data_ov002_022cc364);
    h = func_02006c0c(sprintf_buf, 4, 0);
    func_0201d47c(buf);
    *(int *)(buf + 0x0) = h;
    *(u16 *)(buf + 0x14) = (*(u16 *)(buf + 0x14) & ~0xf) | 9;
    *(int *)(buf + 0xc) = 0xc980;
    *(short *)(buf + 0x10) = -1;
    func_0201e5b8(buf);
    Task_Invoke(h);
}
