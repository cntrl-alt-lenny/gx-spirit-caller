typedef struct { unsigned int id:13; unsigned int low:1; unsigned int pad:8; unsigned int high:8; unsigned int rest:2; } Slot;
struct State { char pad[0xd78]; int result; char pad2[0x20]; int phase; };
struct Counts { char pad[0xa2]; unsigned short card; char pad2[0xc]; unsigned short value, count, id; };
extern struct State data_ov002_022d016c;
extern struct Counts data_ov002_022d0e6c;
extern char data_ov002_022cf16c[], data_ov002_022cf178[];
extern int data_ov002_022cd744[];
extern int func_0202b100(int a0);
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021d87a4(int arg0, int arg1, int arg2);
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern int func_ov002_0226be44(int side, int kind, int index);
extern void func_ov002_02290500(int side, int id, int callback);
extern void func_ov002_0229ce5c(char *out, int format, int text);
int func_ov002_0226bfa8(int side, int id) {
    unsigned short card = data_ov002_022d0e6c.card;
    unsigned int i, found;
    Slot *slot;
    char buffer[256];
    switch(data_ov002_022d016c.phase) {
    case 0:
        found = 0;
        data_ov002_022d0e6c.value = 0;
        data_ov002_022d0e6c.count = 0;
        data_ov002_022d0e6c.id = id;
        i = found;
        if (i < *(unsigned int *)(data_ov002_022cf178 + (side&1)*0x868)) do {
            if (func_ov002_0226be44(side, 0xb, i)) { found = 1; break; }
            i++;
        } while (i < *(unsigned int *)(data_ov002_022cf16c + (side&1)*0x868 + 0xc));
        if (!found) return 1;
        switch (id) {
        case 0x135b: break;
        case 0x132b: func_ov002_021ae400(side, 0x1f); break;
        case 0x137c: func_ov002_021ae400(side, 0x2e); break;
        case 0x1579: case 0x17c3: func_ov002_021ae400(side, 0x11e); break;
        case 0x16d3:
            func_ov002_0229ce5c(buffer, 0x60, func_0202b100(card));
            func_ov002_021ae400(side, (int)buffer); break;
        case 0x15dc: case 0x1888: func_ov002_021ae400(side, 0x1f); break;
        case 0x15e8: func_ov002_021ae400(side, 0xf3); break;
        case 0x1a19: func_ov002_021ae400(side, 0x46); break;
        }
        if (data_ov002_022cd744[side] == 1) func_ov002_02290500(side, id, (int)func_ov002_0226be44);
        else func_ov002_022592ec((int)func_ov002_0226be44);
        data_ov002_022d016c.phase++;
        return 0;
    case 1:
        if (func_ov002_022593f4()) {
            data_ov002_022d0e6c.value = data_ov002_022d016c.result;
            slot = (Slot *)(data_ov002_022cf16c + (side&1)*0x868 + 0x120) + data_ov002_022d016c.result;
            data_ov002_022d0e6c.count = slot->high*2 + slot->low;
            data_ov002_022d016c.phase++;
            return 0;
        }
        data_ov002_022d016c.phase--;
        return 0;
    case 2:
        func_ov002_021d87a4(side, 0xb, data_ov002_022d0e6c.count);
        data_ov002_022d016c.phase++;
        return 0;
    }
    return 1;
}


