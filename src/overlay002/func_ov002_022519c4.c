typedef unsigned int u32;
typedef struct { u32 id:13; u32 side:1; u32 unused:8; u32 index:8; u32 rest:2; } Ent;
typedef struct { u32 count; char pad[0x864]; } Count;
typedef struct { char pad[0xc]; u32 count11; u32 count13; char pad14[0x10c]; Ent cards11[80]; Ent cards13[80]; char tail[0x4c8]; } Player;
extern Player data_ov002_022cf16c[];
extern Count data_ov002_022cf178[];
extern Count data_ov002_022cf17c[];
extern int func_0202ed90(int a0);
extern unsigned int func_0202b8a8(int id);
extern int func_ov002_021c38c4(int side, int index);
extern int func_ov002_021ca440(int arg0, int arg1);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_022519c4(int a) {
    u32 player = a & 1;
    u32 i = 0;
    int id;


    if (i < data_ov002_022cf178[player].count) {


        do {
            id = data_ov002_022cf16c[player].cards11[i].id;
            if (func_0202ed90(id) != 0 && func_ov002_021c38c4(a, data_ov002_022cf16c[player].cards11[i].index * 2 + data_ov002_022cf16c[player].cards11[i].side) <= 4 && func_ov002_021ca440(a, id) != 0)
                func_ov002_02253458(a, 11, i);
            i++;

        } while (i < data_ov002_022cf16c[player].count11);
    }
    i = 0;
    if (i < data_ov002_022cf17c[player].count) {


        do {
            id = data_ov002_022cf16c[player].cards13[i].id;
            if (func_0202ed90(id) != 0 && (int)func_0202b8a8(id) <= 4 && func_ov002_021ca440(a, id) != 0)
                func_ov002_02253458(a, 13, i);
            i++;

        } while (i < data_ov002_022cf16c[player].count13);
    }
}




