typedef unsigned int u32;
typedef unsigned short u16;
struct Entry { u32 id:13; u32 rest:19; char pad[12]; u32 flags; };
struct Player { int life; char pad[44]; struct Entry cards[5]; char tail[0x7d4]; };
struct Status { u16 value; char pad[18]; };
struct StatusPlayer { struct Status entries[5]; char pad[0x804]; };
struct Flags { u32 flags; char pad[16]; };
struct FlagsPlayer { struct Flags entries[5]; char pad[0x804]; };
extern struct Player data_ov002_022cf16c[];
extern struct StatusPlayer data_ov002_022cf1a4[];
extern struct FlagsPlayer data_ov002_022cf1ac[];
extern char data_ov002_022d016c[];
extern int func_ov002_021b9ecc(int a,int b);
extern int func_0202f9e8(int a);
extern int func_ov002_021bbf50(int arg0);
/* This caller supplies only two arguments to the four-argument thunk. */
extern int func_ov002_021bb90c();
/* This caller supplies only two arguments to the four-argument thunk. */
extern int func_ov002_021bbc58();
extern void func_ov002_021c4c9c(int a,int b,int *out);
extern int func_ov002_0227b174(int player,int attack,int defense);
/* Existing callee C has a conflicting void/pointer signature; this caller reads r0. */
extern int func_ov002_0227d660(int player,int arg);
extern int func_ov002_021c848c(int a,int b);
int func_ov002_0227b37c(int player,int slot) {
    int buf[11];
    int id = func_ov002_021b9ecc(player,slot);
    int i, found, n, result;
    if (!((data_ov002_022cf1ac[player & 1].entries[slot].flags >> 6) & 1)) {
        switch(id) {
        case 0x1286: case 0x1370: case 0x1476: case 0x19bd: case 0x19d2:
            if (data_ov002_022cf1a4[player & 1].entries[slot].value == 0) return 1;
            break;
        case 0x129a: case 0x12a3: case 0x1439: case 0x14af: case 0x1621:
        case 0x1639: case 0x1743: case 0x18c3: case 0x1a07: case 0x1a78:
            return 0;
        case 0x1813: case 0x1815: case 0x195a: return 1;
        case 0x13ad:
            if (data_ov002_022cf1a4[player & 1].entries[slot].value == 0) return 0;
            break;
        case 0x13a7:
            if (data_ov002_022cf16c[player & 1].life > 2000) return 0;
            break;
        case 0x1451:
            if (data_ov002_022cf1a4[player & 1].entries[slot].value != 0 && func_ov002_021bbf50(1-player) == 0 && func_ov002_021bbf50(player) > 1) return 1;
            break;
        case 0x147f:
            if (data_ov002_022cf1a4[player & 1].entries[slot].value == 0) {
                found = 0;
                for (i=0;i<=4;i++) {
                    if (data_ov002_022cf16c[(1-player)&1].cards[i].id && ((data_ov002_022cf16c[(1-player)&1].cards[i].flags >> 4)&1)) found=1;
                }
                if (found) {
                    for(i=0;i<=4;i++) {
                        if(data_ov002_022cf16c[player&1].cards[i].id && ((data_ov002_022cf16c[player&1].cards[i].flags >> 4)&1)) found=0;
                    }
                    if(found) return 0;
                }
            }
            break;
        case 0x147a:
            if (func_ov002_021bb90c(player,0x146f) == 0) return 1;
            break;
        case 0x19a8:
            if (func_ov002_021bbf50(1-player) == 0) return 0;
            break;
        case 0x191c:
            if (func_ov002_021bbc58(player,7) != 0) return 0;
            break;
        case 0x1855:
            n = func_ov002_0227d660(player,0);
            if(n >= 0 && func_ov002_021c848c(n & 0xff, ((u16)n >> 8)&0xff) >= 1000) return 0;
            break;
        case 0x160a: case 0x1620: case 0x190b: case 0x1917:
            if (*(int *)(data_ov002_022d016c+0xdc) == 0x175e) return 0;
            break;
        }
        if (func_0202f9e8(id) != 0 && data_ov002_022cf1a4[player&1].entries[slot].value == 0) return 1;
    }
    if (data_ov002_022cf1a4[player&1].entries[slot].value != 0) {
        func_ov002_021c4c9c(player,slot,buf);
    } else {
        data_ov002_022cf1a4[player&1].entries[slot].value=1;
        func_ov002_021c4c9c(player,slot,buf);
        data_ov002_022cf1a4[player&1].entries[slot].value=0;
    }
    result=func_ov002_0227b174(player,buf[5],buf[6]);
    if(result == -1) return -1;
    return result;
}


