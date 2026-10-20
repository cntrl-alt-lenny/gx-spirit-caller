typedef struct { unsigned int id:13; unsigned int low:1; unsigned int pad:8; unsigned int high:8; unsigned int rest:2; } Slot;
struct State { char pad[0xd9c]; int phase; };
struct Counts { char pad[0xb0]; unsigned short value, count; };
extern struct State data_ov002_022d016c;
extern struct Counts data_ov002_022d0e6c;
extern char data_ov002_022cf178[];
extern char data_ov002_022cf16c[];
extern unsigned int func_ov002_021b00d0(unsigned int x);
extern void func_ov002_021d479c(unsigned short a0, unsigned short a1, unsigned short a2, unsigned short a3);
extern void func_ov002_021d7b44(int side, Slot *slot, int flag);
extern int func_ov002_021d87a4(int arg0, int arg1, int arg2);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
int func_ov002_0226b8f8(int side, int flag, int count) {
    int index;
    Slot *slot;
    int mode = count == 0;
    switch (data_ov002_022d016c.phase) {
    case 0:
        if (*(unsigned int *)(data_ov002_022cf178 + (side & 1) * 0x868) == 0) return 1;
        data_ov002_022d0e6c.count = count + mode;
        if (!mode) func_ov002_021e2b3c((int)&data_ov002_022d0e6c);
        data_ov002_022d016c.phase++;
        return 0;
    case 1:
        if (data_ov002_022d0e6c.count && *(unsigned int *)(data_ov002_022cf178 + (side & 1) * 0x868)) {
            index = func_ov002_021b00d0(*(unsigned int *)(data_ov002_022cf178 + (side & 1) * 0x868));
            func_ov002_021d479c((side ? 0x8000 : 0) | 0x53, 0, 0, 0);
            slot = (Slot *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x120) + index;
            func_ov002_021d87a4(side, 0xb, slot->high * 2 + slot->low);
            if (mode) {
                data_ov002_022d0e6c.value = index;
                data_ov002_022d016c.phase++;
                return 0;
            }
            func_ov002_021d7b44(side, slot, flag != 0);
            data_ov002_022d0e6c.value = slot->high * 2 + slot->low;
            data_ov002_022d0e6c.count--;
            return 0;
        }
        data_ov002_022d016c.phase++;
        return 0;
    case 2:
        if (!mode) func_ov002_021e2c5c(data_ov002_022d016c.phase);
        return 1;
    }
    return 1;
}
