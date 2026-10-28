typedef unsigned int u32;
struct Global { char pad[0xd50]; int state; int d54; int d58; u32 id; u32 index; int d64; int phase; int d6c; u32 side; int d74; int slot; u32 result; };
extern struct Global data_ov002_022d016c;
extern int func_ov002_021e25f0(int a, int b, int c);
extern void func_ov002_021e3354(u32 packed, int index, void *q);
extern void func_ov002_021e311c(u32 packed, int index);
extern unsigned int func_0202b878(int id);
extern void func_ov002_021e2d20(int arg0, int arg1, int arg2);

void func_ov002_022583b4(int a, int b, void *q)
{
    if (data_ov002_022d016c.phase == 0) {
        data_ov002_022d016c.result = func_ov002_021e25f0(data_ov002_022d016c.side, data_ov002_022d016c.slot, a);
        (data_ov002_022d016c.phase)++;
        return;
    }
    if (a != 0) {
        if (b != 0) {
            func_ov002_021e3354(((data_ov002_022d016c.side << 31) & 0x80000000) | ((data_ov002_022d016c.result << 16) & 0x1f0000) | (data_ov002_022d016c.id & 0xffff), data_ov002_022d016c.index & 0xffff, q);
        } else {
            func_ov002_021e311c(((data_ov002_022d016c.side << 31) & 0x80000000) | ((data_ov002_022d016c.result << 16) & 0x1f0000) | (data_ov002_022d016c.id & 0xffff), data_ov002_022d016c.index & 0xffff);
        }
        if (func_0202b878(data_ov002_022d016c.id) == 0x16) {
            func_ov002_021e2d20(data_ov002_022d016c.side, 0x1a, 1);
        }
    }
    data_ov002_022d016c.state = 0;
}


