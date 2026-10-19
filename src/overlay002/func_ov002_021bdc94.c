typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { u32 id:13; u32 rest:19; } Entry;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021bd948(int, int);
extern int func_ov002_021c9fc4(int arg0);
extern int func_ov002_021bb90c();
extern int func_02031838(int x);
extern int func_0202e42c(int);
extern int func_ov002_021bc000(int player, int (*fn)(int));
int func_ov002_021bdc94(int a, int b)
{
    u32 off = (a & 1) * 0x868;
    u32 row = b * 0x14;
    if (*(u16 *)(data_ov002_022cf1a4 + off + row) != 0) return 0;
    if (func_ov002_021bd948(a,b) == 0) return 0;
    if (func_ov002_021c9fc4(a) == 0) return 0;
    { u32 id = ((Entry *)(data_ov002_022cf16c + off + 0x30 + row))->id;
    switch (id) {
    case 0x158b:
    case 0x160f:
        if (func_ov002_021bb90c(a, id) != 0) return 0;
        break;
    case 0x164a: case 0x164b: case 0x164c: case 0x164d: case 0x164e: case 0x164f:
        if (func_ov002_021bb90c(a, func_02031838(id)) == 0) return 0;
        break;
    case 0x1691:
        if (func_ov002_021bc000(a,func_0202e42c) == 0) return 0;
        break;
    }
    }
    return 1;
}



