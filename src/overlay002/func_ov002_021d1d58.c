typedef unsigned short u16;
struct Rec { unsigned int id:13; unsigned int flag13:1; unsigned int mid:8; unsigned int hi:8; };
typedef union { struct { u16 player:1; u16 kind:5; u16 index:8; u16 flag14:1; u16 flag15:1; } b; u16 raw; } Location;
typedef struct { u16 flags; char pad[0x80a]; int f80c; int f810; int f814; struct Rec card; } State;
typedef struct { int count; char pad[0x864]; } Player;
extern State data_ov002_022ce950;
extern Player data_ov002_022cf180[];
extern struct Rec data_ov002_022cf168;
extern int func_0202e2c8(int unused0);
extern void func_ov002_021b91c4(int *dst, const int *src);
extern void *func_ov002_021c93f0(int player, int kind, int extra);
extern void func_ov002_021baa04(int player, int kind, int extra);
extern void func_ov002_021bab38(int arg0, int kind, int v, struct Rec *p);
extern int func_ov002_0229ade0(int cmd, ...);
void func_ov002_021d1d58(void) {
    Location source, dest;
    int player = (data_ov002_022ce950.flags & 0x8000) ? 1 : 0;
    if (data_ov002_022ce950.f810 == 0) {
        if (data_ov002_022cf180[player & 1].count != 0) {
            func_ov002_021b91c4((int *)&data_ov002_022cf168, func_ov002_021c93f0(player, 14, data_ov002_022cf180[player & 1].count - 1));
            source.b.player = (u16)player;
            source.b.kind = 14;
            source.b.index = (u16)(data_ov002_022cf180[player & 1].count - 1);
            source.b.flag15 = 0;
            source.b.flag14 = 1;
            dest.b.player = (u16)player;
            dest.b.kind = (u16)(func_0202e2c8(data_ov002_022ce950.card.id) ? 12 : 13);
            dest.b.index = 0;
            dest.b.flag15 = 0;
            dest.b.flag14 = 0;
            func_ov002_021baa04(player, 14, data_ov002_022cf180[player & 1].count - 1);
            func_ov002_021bab38(dest.b.player, dest.b.kind, dest.b.index, &data_ov002_022cf168);
            func_ov002_0229ade0(24, (u16)(data_ov002_022ce950.card.hi * 2 + data_ov002_022ce950.card.flag13), source.raw, dest.raw);
        } else {
            data_ov002_022ce950.f80c = 0;
        }
    }
}
