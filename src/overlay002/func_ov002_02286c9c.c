typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
struct Self { char pad[2]; u16 player:1; u16 rest:15; };
struct Player { u32 field; char pad[0x864]; };
struct State { char pad[0x5d4]; u32 count; char pad2[4]; u8 types[1]; };
struct Entry { u32 id:9; u32 rest:23; };
struct Card { u16 id:13; u16 rest:3; u16 pad; };
extern struct Player data_ov002_022cf178[];
extern struct State data_ov002_022ce288;
extern struct Entry data_ov002_022ce884[];
extern struct Card data_ov002_022d0250[];
extern unsigned int func_0202b8a8(int id);
extern int func_0202b8f0(int unused0);
extern int func_0203058c(int a);
extern int func_ov002_02281a74(int arg0);
extern void func_ov002_02280a1c(int player, int *attack, int *defense, int mode);
int func_ov002_02286c9c(struct Self *self) {
    int attack, defense;
    u32 i;
    if (data_ov002_022cf178[self->player & 1].field > 2) return 0;
    if (func_ov002_02281a74(self->player) == 0) return 0;
    func_ov002_02280a1c(1-self->player, &attack, &defense, 1);
    for (i=0; i<data_ov002_022ce288.count; i++) {
        if (data_ov002_022ce288.types[i] == 0x16) {
            int id=data_ov002_022d0250[data_ov002_022ce884[i].id].id;
            if ((int)func_0202b8a8(id)>4) return 1;
            if (func_0203058c(id)!=0) return 1;
            if (func_0202b8f0(id)>0x578 && func_0202b8f0(id)+0x320>=attack) return 1;
        }
    }
    return 0;
}
