typedef unsigned int u32;
typedef unsigned short u16;
struct Entry { u32 id:13; u32 rest:19; char pad[16]; };
struct Player { int life; char pad[44]; struct Entry cards[5]; char tail[0x7d4]; };
struct Status { u16 value; char pad[18]; };
struct StatusPlayer { struct Status entries[5]; char pad[0x804]; };
struct Flags { u32 flags; char pad[16]; };
struct FlagsPlayer { struct Flags entries[5]; char pad[0x804]; };
extern struct Player data_ov002_022cf16c[];
extern struct StatusPlayer data_ov002_022cf1a4[];
extern struct FlagsPlayer data_ov002_022cf1ac[];
extern unsigned int func_0202b8a8(int id);
extern int func_ov002_021bae7c(int player, int code, int arg);
extern void func_ov002_021c4c9c(int a, int b, int *out);
void func_ov002_0227af30(int a, int b, int *out) {
    u32 id;
    if (data_ov002_022cf1a4[a & 1].entries[b].value == 0) {
        id = data_ov002_022cf16c[a & 1].cards[b].id;
        if ((data_ov002_022cf1ac[a & 1].entries[b].flags >> 8) & 1) {
            data_ov002_022cf1a4[a & 1].entries[b].value = 1;
            func_ov002_021c4c9c(a,b,out);
            data_ov002_022cf1a4[a & 1].entries[b].value = 0;
            return;
        }
        out[4] = func_0202b8a8(id);
        if (data_ov002_022cf16c[(1-a) & 1].life < 1000 || func_ov002_021bae7c(a,0x130c,-1)) {
            if (out[4] <= 4) { out[5] = 1300; out[6] = 2000; }
            else { out[5] = 1700; out[6] = 2400; }
        } else {
            if (out[4] <= 4) { out[5] = 1200; out[6] = 1000; }
            else { out[5] = 2100; out[6] = 1800; }
        }
        out[2] = 0; out[1] = 0; out[0] = 0;
    } else {
        func_ov002_021c4c9c(a,b,out);
    }
}

