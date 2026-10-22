typedef unsigned int u32;
typedef struct { u32 low:13; u32 side:1; u32 middle:8; u32 index:8; u32 high:2; } Entry;
typedef struct { char pad[0xd48]; int mode; int active; char pad2[0x30]; int error; int (*callback)(int,int,int); } State;
extern State data_ov002_022d016c;
extern int data_ov002_022cd73c[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern char data_ov002_022ce288[];
extern char data_ov002_022ce588[];
typedef struct { unsigned short low:4; unsigned short value:2; unsigned short high:10; } Flags;
extern struct { char pad[0x16]; Flags flags; } data_ov002_022cd300;
extern int func_ov002_021b9ecc(int a,int b);
extern int func_ov002_02258690(int card,int player,int slot);
extern int func_ov002_022589c0(int a,int b,int c);
extern int func_ov002_02258d4c(int a,int b,int c);
extern int func_ov002_02259058(int a,int b,unsigned int c);
extern int func_ov002_02259124(int a,int b,int c,unsigned int d);
extern int func_ov002_022591e4(int a,int b);
extern int func_ov002_02259278(int a,int b);
extern int func_ov002_0226eb5c(int a,int b,int c,int d);
int func_ov002_02259420(int a,int b,unsigned int c)
{
    int result;
    if (!data_ov002_022d016c.active) return 0;
    switch (data_ov002_022d016c.mode) {
    case 1:
        switch (b) {
        case 12: case 13: case 14: case 15:
            result = func_ov002_022591e4(a,b);
            result |= func_ov002_02259278(a,b);
            if (a == data_ov002_022cd73c[1] && b == 13) result |= 0x1000;
            return result;
        }
        break;
    case 2: case 3:
        switch (b) {
        case 0: case 1: case 2: case 3: case 4:
            b += c;
            if (!((Entry *)(data_ov002_022cf16c + (a & 1)*0x868 + b*0x14 + 0x30))->low) return 0;
            return func_ov002_022589c0(func_ov002_021b9ecc(a,b),a,b);
        case 5: case 6: case 7: case 8: case 9: case 10:
            b += c;
            if (!((Entry *)(data_ov002_022cf16c + (a & 1)*0x868 + b*0x14 + 0x30))->low) return 0;
            return func_ov002_02258d4c(func_ov002_021b9ecc(a,b),a,b);
        case 11:
            if (c >= *(u32 *)(data_ov002_022cf178 + (a & 1)*0x868)) return 0;
            return func_ov002_02258690(((Entry *)(data_ov002_022cf16c + (a & 1)*0x868 + 0x120))[c].low,a,c);
        case 12: case 13: case 14: case 15:
            result = func_ov002_022591e4(a,b);
            result |= func_ov002_02259278(a,b);
            if (a == data_ov002_022cd73c[1] && b == 13) result |= 0x400;
            return result;
        }
        break;
    case 4: return func_ov002_02259058(a,b,c);
    case 5: return func_ov002_02259124((int)(data_ov002_022ce588 + (*(int *)(data_ov002_022ce288+0x484)-1)*0x18),a,b,c);
    case 6:
        if (a == data_ov002_022cd73c[1] && b == 11) {
            Entry *entry;
            if (c >= *(u32 *)(data_ov002_022cf178 + (a & 1)*0x868)) return 0;
            entry = &((Entry *)(data_ov002_022cf16c + (a & 1)*0x868 + 0x120))[c];
            return func_ov002_0226eb5c(a,entry->index*2+entry->side,1,data_ov002_022cd300.flags.value);
        }
        break;
    case 7: case 9:
        if (data_ov002_022d016c.callback) {
            if (b == 11 && c >= *(u32 *)(data_ov002_022cf178 + (a & 1)*0x868)) return 0;
            return data_ov002_022d016c.callback(a,b,c);
        }
        break;
    case 8: case 10:
        if (data_ov002_022d016c.callback && (int)(b+c) <= 10) {
            if (data_ov002_022d016c.callback(*(int *)(data_ov002_022ce288+0x48c),a,b+c)) return 0x800;
            data_ov002_022d016c.error = 9;
        }
        break;
    }
    return 0;
}


