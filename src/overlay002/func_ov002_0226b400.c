typedef unsigned int u32;
struct State { char pad[0xd78]; u32 limit; char pad2[0x20]; u32 phase; };
struct Counts { char pad[0xb2]; unsigned short count, index; };
struct Row { char pad[0xc]; u32 count; char tail[0x858]; };
extern struct State data_ov002_022d016c;
extern struct Counts data_ov002_022d0e6c;
extern struct Row data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int data_ov002_022cd744[];
extern int func_ov002_0226b2b8(int player, int kind, int slot);
extern int func_ov002_021ae770(int x);
extern void func_ov002_021d7970(void *arg0, int arg1, int arg2);
extern void func_ov002_021d79d0(void *arg0, int arg1);
extern void func_ov002_021d7a1c(void *arg0, int arg1);
extern void func_ov002_021d7c1c(void *a, void *b, void *c);
extern void func_ov002_021d7c40(void *arg0, int arg1);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern void func_ov002_02259324(int arg0);
extern int func_ov002_022593f4(void);
extern void func_ov002_02290500(void *side, int kind, int (*callback)(int,int,int));
extern int func_ov002_0229ade0(int a, int b, int c, int d);
int func_ov002_0226b400(void *side, int count, int flags) {
    int offset = ((u32)side & 1) * 0x868;
    int f16;
    u32 i;
    int found = 0;
    i = 0;
    int f1 = flags & 1;
    int f2 = flags & 2;
    int f8 = flags & 8;
    f16 = flags & 16;
    int f32 = flags & 32;
    int f128 = flags & 128;
    if (i < *(u32 *)(data_ov002_022cf178 + offset)) {
        do {
            if (func_ov002_0226b2b8((int)side, 11, i)) { found = 1; break; }
            i++;
        } while (i < ((struct Row *)((char *)data_ov002_022cf16c + offset))->count);
    }
    switch (data_ov002_022d016c.phase) {
    case 0:
        if (!found) return 1;
        func_ov002_021e2b3c(data_ov002_022d016c.phase);
        data_ov002_022d0e6c.count = count;
        data_ov002_022d016c.phase++;
    case 1:
        if (data_ov002_022cd744[(int)side] == 0) {
            if (f32) func_ov002_021ae770(0x3d);
            else if (f8) func_ov002_021ae770(0x14);
            else if (f1) func_ov002_021ae770(0x29);
            else func_ov002_021ae770(0xeb);
        }
        data_ov002_022d016c.phase++;
        return 0;
    case 2:
        if (!data_ov002_022d0e6c.count || !found) {
            func_ov002_021e2c5c(data_ov002_022d0e6c.count);
            return 1;
        }
        if (data_ov002_022cd744[(int)side] == 1) {
            func_ov002_02290500(side, (!f16 && !f128) + 2, func_ov002_0226b2b8);
        } else {
            u32 index = *(u32 *)(data_ov002_022cf178 + offset) - 1;
            if (index >= data_ov002_022d016c.limit - 1) index = data_ov002_022d016c.limit - 1;
            func_ov002_0229ade0(7, (int)side, 11, index);
            func_ov002_02259324((int)func_ov002_0226b2b8);
        }
        data_ov002_022d016c.phase++;
        return 0;
    case 3:
        if (func_ov002_022593f4()) {
            data_ov002_022d0e6c.index = data_ov002_022d016c.limit;
            data_ov002_022d016c.phase++;
            return 0;
        }
        data_ov002_022d016c.phase -= 2;
        return 0;
    case 4:
        if (f32) {
            int selected = data_ov002_022d0e6c.index;
            if (f16) func_ov002_021d7c40(side, selected);
            else func_ov002_021d7c1c(side, (char *)data_ov002_022cf16c + offset + 0x120 + selected * 4, (void *)(f2 != 0));
        } else {
            int selected = data_ov002_022d0e6c.index;
            if (f128) func_ov002_021d79d0(side, selected);
            else if (f16) func_ov002_021d7a1c(side, selected);
            else func_ov002_021d7970(side, selected, f2);
        }
        data_ov002_022d0e6c.count--;
        data_ov002_022d016c.phase -= 2;
        return 0;
    }
    return 0;
}





