typedef unsigned short u16;
typedef unsigned char u8;
typedef struct { unsigned int id:13; unsigned int rest:19; } Card;
typedef struct { char pad[0xc]; unsigned int count11; unsigned int count13; char pad14[0x10c]; Card cards11[80]; Card cards13[1]; char tail[0x604]; } Side;
typedef struct { unsigned int count; char pad[0x864]; } Count;
extern Side data_ov002_022cf16c[];
extern Count data_ov002_022cf178[];
extern Count data_ov002_022cf17c[];
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b890(int id);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_0224e518(int player, int unused, int key) {
    unsigned int i = 0;
    u8 hi, lo;
    int kind;
    if (i < data_ov002_022cf178[player & 1].count) {
        hi = (u16)key >> 8;
        lo = key;
        do {
            int id = data_ov002_022cf16c[player & 1].cards11[i].id;
            if (hi == func_0202b878(id) && lo == func_0202b890(id)) {
                func_ov002_02253458(player, 11, i);
            }
            i++;
        } while (i < data_ov002_022cf16c[player & 1].count11);
    }
    i = 0;
    if (i < data_ov002_022cf17c[player & 1].count) {
        hi = (u16)key >> 8;
        lo = key;
        kind = 13;
        do {
            int id = data_ov002_022cf16c[player & 1].cards13[i].id;
            if (hi == func_0202b878(id) && lo == func_0202b890(id)) {
                func_ov002_02253458(player, kind, i);
            }
            i++;
        } while (i < data_ov002_022cf16c[player & 1].count13);
    }
}






