typedef struct { unsigned int id:13; unsigned int low:1; unsigned int pad:8; unsigned int high:8; unsigned int rest:2; } Slot;
struct State { char pad[0xd78]; int result; char pad2[0x20]; int phase; };
struct Counts { char pad[0xb0]; unsigned short value; };
extern struct State data_ov002_022d016c;
extern struct Counts data_ov002_022d0e6c;
extern char data_ov002_022cf178[], data_ov002_022cf16c[];
extern int data_ov002_022cd744[];
extern void func_ov002_021ae400(int a, int b);
extern unsigned int func_ov002_021b00d0(unsigned int x);
extern void func_ov002_021d479c(unsigned short a0, unsigned short a1, unsigned short a2, unsigned short a3);
extern int func_ov002_021d87a4(int arg0, int arg1, int arg2);
extern int func_ov002_021e27c0(int self_thing, int arg1);
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern int func_ov002_0226bad0(int a, int b);
extern int func_ov002_0226baf8(int arg0, int arg1, int idx);
extern int func_ov002_0226bb58(int arg0, int arg1, int arg2);
extern void func_ov002_02290500(int side, int id, int callback);
int func_ov002_0226bbb8(int side, int id, int flag) {
    int callback = (int)func_ov002_0226bad0;
    int other;
    Slot *slot;
    switch (id) {
    case 0x1509: callback = (int)func_ov002_0226baf8; break;
    case 0x14ab: case 0x1546: case 0x1a70: callback = (int)func_ov002_0226bb58; break;
    }
    switch (data_ov002_022d016c.phase) {
    case 0:
        if (*(unsigned int *)(data_ov002_022cf178 + ((1-side)&1)*0x868) == 0) data_ov002_022d0e6c.value = 0xffff;
        func_ov002_021ae400(side, 0xf4);
        data_ov002_022d016c.phase++;
        return 0;
    case 1:
        if (flag) func_ov002_021e27c0(1-side, 1);
        data_ov002_022d016c.phase++;
        return 0;
    case 2:
        if (data_ov002_022cd744[side] == 1) {
            if (flag) func_ov002_02290500(side, id, callback);
            else {
                other = 1-side;
                func_ov002_021d479c((other ? 0x8000 : 0) | 0x53, 0, 0, 0);
                data_ov002_022d0e6c.value = func_ov002_021b00d0(*(unsigned int *)(data_ov002_022cf178 + (other&1)*0x868));
                data_ov002_022d016c.phase = 4;
                return 0;
            }
        } else func_ov002_022592ec(callback);
        data_ov002_022d016c.phase++;
        return 0;
    case 3:
        if (!func_ov002_022593f4()) { data_ov002_022d016c.phase = 0; return 0; }
        data_ov002_022d0e6c.value = data_ov002_022d016c.result;
        data_ov002_022d016c.phase++;
        return 0;
    case 4:
        other = 1-side;
        slot = (Slot *)(data_ov002_022cf16c + (other&1)*0x868 + 0x120) + data_ov002_022d0e6c.value;
        func_ov002_021d87a4(other, 0xb, slot->high*2+slot->low);
        data_ov002_022d016c.phase++;
        return 0;
    case 5:
        if (flag) func_ov002_021e27c0(1-side, 0);
        data_ov002_022d016c.phase++;
        return 0;
    }
    return 1;
}
