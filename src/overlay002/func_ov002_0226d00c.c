typedef unsigned int u32;
typedef unsigned short u16;
struct State { char pad[0xd44]; u32 count; char pad2[0x54]; int phase; };
struct Output { char pad[0xa2]; u16 amount; char pad2[0xc]; u16 count; u16 value; };
extern struct State data_ov002_022d016c;
extern struct Output data_ov002_022d0e6c;
struct Record { u32 id:13; u32 flag:1; u32 pad:8; u32 value:8; u32 top:2; };
extern struct { char pad[0x1db2]; u16 values[7]; } data_ov002_022cf16c;
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int player, int phase, int card, int arg);
extern int *func_ov002_021afb74(void);
extern u32 *func_ov002_021b004c(int id);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_022536e8(int self, int arg1, int arg2);
int func_ov002_0226d00c(int self, int id) {
    int amount = data_ov002_022d0e6c.amount;
    int value;
    int i;
    u32 *p;
    int *q;
    switch (data_ov002_022d016c.phase) {
    case 0:
        switch (id) {
        case 0x132f: case 0x13ed: case 0x1717: case 0x17f4:
            func_ov002_021ae400(self, 0xf6); break;
        case 0x14ee: case 0x1522: case 0x1531: case 0x166b: case 0x1746:
            if (func_ov002_022536e8(self,id,amount) == 0) {
                func_ov002_021ae400(self,0xd);
                data_ov002_022d0e6c.count = 0;
                data_ov002_022d0e6c.value = 0;
                return 1;
            }
            func_ov002_021ae400(self,0x121); break;
        case 0x1616: func_ov002_021ae400(self,0x5e); break;
        case 0x1712: case 0x1818: case 0x198e:
            func_ov002_021ae400(self,0x11d); break;
        case 0x1796: func_ov002_021ae400(self,0x16); break;
        case 0x14c2: case 0x19c0: func_ov002_021ae400(self,0x56); break;
        }
        data_ov002_022d016c.phase++;
        return 0;
    case 1:
        switch (id) {
        case 0x132f: case 0x14c2: case 0x1717: case 0x1796: case 0x1818: case 0x19c0:
            func_ov002_021af9d0(self,6,id,1); break;
        case 0x13ed: func_ov002_021af9d0(self,0x4a,id,0); break;
        case 0x14ee: case 0x1712:
            if (amount >= 0x20) amount = 0x20;
            func_ov002_021af9d0(self,amount+6,id,0); break;
        case 0x15dd:
            if (amount >= 0x20) amount = 0x20;
            func_ov002_021af9d0(self,amount+0x27,id,0); break;
        case 0x1522: case 0x1531: case 0x1616: case 0x166b: case 0x1746: case 0x17f4:
            func_ov002_021af9d0(self,6,id,amount); break;
        case 0x198e:
            value = func_ov002_022536e8(self,id,amount);
            if (value >= func_ov002_021bc618(self)) value = func_ov002_021bc618(self);
            if (value >= 0x20) value = 0x20;
            func_ov002_021af9d0(self,value+6,id,amount); break;
        }
        data_ov002_022d016c.phase++;
        return 0;
    case 2:
        switch (id) {
        case 0x14ee: case 0x15dd: case 0x1712: case 0x198e:
            value = data_ov002_022d016c.count;
            if ((u32)value > 7) value = 7;
            data_ov002_022d0e6c.count = value;
            for (i=0; i<data_ov002_022d0e6c.count; i++) {
                p = func_ov002_021b004c(i+1);
                data_ov002_022cf16c.values[i] = (((struct Record *)func_ov002_021b004c(i+1))->value << 1) + ((struct Record *)p)->flag;
            }
            return 1;
        default:
            data_ov002_022d0e6c.count = ((struct Record *)func_ov002_021afb74())->id;
            q = func_ov002_021afb74();
            data_ov002_022d0e6c.value = (((struct Record *)func_ov002_021afb74())->value << 1) + ((struct Record *)q)->flag;
            return 1;
        }
    }
    return 0;
}

