typedef unsigned int u32;
extern char data_ov002_022cf1ac[], data_ov002_022cf1a4[], data_ov002_022cf1a8[];
struct State { char pad[0xd40]; u32 counter; };
extern struct State data_ov002_022d016c;
extern int func_ov002_021b9ecc(int a, int b);
extern void func_ov002_021e2d94(int a,int b,int c,int d);
extern int func_ov002_021de480(int a,int b,int c,int d);
extern void func_ov002_021d5b80(int a,int b,int c,int d);
extern int func_ov002_021d5c50(int a,int b,int c,int d);
extern int func_ov002_021d90c0(int a,int b,int c);
extern void func_ov002_021d5b28(int a,int b);
extern void func_ov002_021d637c(int a,int b,int c);
extern void func_ov002_02254efc(int a,int b);
extern int func_020310d8(int x);
extern int func_020312a0(int x);
extern void func_ov002_021d91e0(int a,int b,int c);
extern void func_ov002_021d93e0(int a,int b,int c);
void func_ov002_021d899c(int a,int b,int c) {
    int off = (a & 1) * 0x868;
    int row = b * 20;
    int id;
    if (c == ((*(u32 *)(data_ov002_022cf1ac + off + row) >> 6) & 1)) return;
    id = func_ov002_021b9ecc(a,b);
    func_ov002_021e2d94(a,b,6,c);
    if (*(unsigned short *)(data_ov002_022cf1a4 + off + row) == 0) return;
    if (b <= 4) {
        if (c != 0) {
            switch (id) {
            case 0x1296: case 0x15da: case 0x172e: case 0x1812: case 0x1814: case 0x1816: case 0x181a: case 0x1955:
                if (++data_ov002_022d016c.counter >= 10) {
                    data_ov002_022d016c.counter = 0;
                    func_ov002_021de480(a,b,0,0);
                }
                break;
            case 0x10ac: case 0x10c6: case 0x1153: case 0x1184: case 0x12ac: case 0x1337: case 0x1397: case 0x147a: case 0x147d: case 0x1482: case 0x1527: case 0x154c: case 0x154d: case 0x1644: case 0x1645: case 0x164d: case 0x172b: case 0x1737: case 0x17c9: case 0x17ed: case 0x182d: case 0x1835: case 0x183b: case 0x188f: case 0x18ae: case 0x1996: case 0x19a5: case 0x19f7: case 0x19f8:
                func_ov002_021d5b80(a,b,id,1); break;
            case 0x13b2: func_ov002_021d5c50(a,b,id,1); break;
            case 0x1009:
                func_ov002_021e2d94(a,b,5,0);
                func_ov002_021d5b80(a,b,id,1); break;
            case 0x120e: case 0x12bb: case 0x1388: case 0x1654: case 0x1688: case 0x1838: case 0x1864: case 0x18b4: case 0x18fb: case 0x1a4e: case 0x1a79:
                func_ov002_021d90c0(a,b,0); break;
            case 0x14fc: case 0x1957: func_ov002_021d5b28(a,b); break;
            case 0x13ad: func_ov002_021e2d94(a,b,5,0); break;
            case 0x1281: case 0x1284: case 0x1aae: case 0x1aaf: case 0x1ab0: case 0x1ab1:
                func_ov002_021d637c(a,b,13); break;
            case 0x12a6: func_ov002_021d637c(a,b,12); break;
            case 0x1a1d:
                func_ov002_021d5b80(a,b,id,1);
                func_ov002_021d90c0(a,b,0); break;
            }
        }
    } else {
        switch (id) {
        case 0x1302: case 0x1360: case 0x1495:
            if (++data_ov002_022d016c.counter >= 10) {
                data_ov002_022d016c.counter = 0;
                func_ov002_021de480(a,b,0,0);
            }
            break;
        case 0x1368:
            if (c == 0) func_ov002_02254efc(a,b);
            break;
        case 0x17ff: case 0x184a:
            if (c != 0) func_ov002_021d5b28(a,b);
            break;
        }
    }
    if (c != 0) {
        if (func_020310d8(id) != 0) {
            int v = *(int *)(data_ov002_022cf1a8 + off + row);
            if (v != 0) func_ov002_021d91e0(a,b,-v);
        } else if (func_020312a0(id) != 0) {
            int v = *(int *)(data_ov002_022cf1a8 + off + row);
            if (v != 0) func_ov002_021d93e0(a,b,-v);
        }
    }
}

