typedef unsigned int u32;
typedef unsigned short u16;
struct Card { u32 id:13; u32 bit13:1; u32 pad:8; u32 slot:8; u32 rest:2; };
struct State { char pad[12]; u32 count; char pad2[272]; struct Card cards[1]; };
struct Settings { char pad[22]; u16 padbits:4; u16 mode:2; u16 rest:10; };
extern char data_ov002_022cf16c[];
extern u32 data_ov002_022cf178[];
extern int data_ov002_022cd524;
extern struct Settings data_ov002_022cd300;
extern int func_ov002_0226eb5c(int, int, int, int);
extern int func_ov002_0227b960(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_02259774(int bit0, int val5, int val8, int flag);
extern int func_0202f9e8(int);
extern unsigned int func_0202b8a8(int id);
extern int func_0202e234(int x);
void func_ov002_02290c9c(int arg) {
    u32 offset = (arg & 1) * 0x868;
    u32 i;
    int id, flags, result;
    data_ov002_022cd524 = arg;
    i=0; if (i < *(u32 *)((char *)data_ov002_022cf178+offset)) do {
        id = ((struct State *)(data_ov002_022cf16c+offset))->cards[i].id;
        switch (id) {
        case 0x1386: case 0x1387: case 0x1388: case 0x13b5: case 0x154b: case 0x1905:
            flags = func_ov002_0226eb5c(arg, ((struct State *)(data_ov002_022cf16c+offset))->cards[i].bit13 + (((struct State *)(data_ov002_022cf16c+offset))->cards[i].slot << 1), 1, data_ov002_022cd300.mode);
            if (flags) {
                result = func_ov002_0227b960(arg,id,0,0);
                if (result) { if (!(flags & 0x40)) result=0; }
                if (!result) { if (!(flags & 0x10)) result=1; }
                func_ov002_02259774(arg,0xb,i,result ? 6 : 4);
                return;
            }
            break;
        }
        i++;
    } while (i < ((struct State *)(data_ov002_022cf16c+offset))->count);
    i=0; if (i < *(u32 *)((char *)data_ov002_022cf178+offset)) do {
        if (func_0202f9e8(((struct State *)(data_ov002_022cf16c+offset))->cards[i].id)) {
            flags=func_ov002_0226eb5c(arg, ((struct State *)(data_ov002_022cf16c+offset))->cards[i].bit13 + (((struct State *)(data_ov002_022cf16c+offset))->cards[i].slot << 1), 1, data_ov002_022cd300.mode);
            if (flags & 0x40) {
                func_ov002_02259774(arg,0xb,i,6); return;
            }
        }
        i++;
    } while (i < ((struct State *)(data_ov002_022cf16c+offset))->count);
    { int cardid, bits; struct Card *p; struct State *state; u32 j;
    j=0; if (j < *(u32 *)((char *)data_ov002_022cf178+offset)) { state=(struct State *)(data_ov002_022cf16c+offset); p=state->cards; do {
        cardid=(*p).id;
        if ((int)func_0202b8a8(cardid)>=5) {
            bits=func_ov002_0226eb5c(arg, (*p).bit13 + ((*p).slot << 1), 1, data_ov002_022cd300.mode);
            if (bits) {
                result=func_ov002_0227b960(arg,cardid,0,0);
                if (result) { if (!(bits & 0x40)) result=0; }
                if (!result) { if (!(bits & 0x10)) result=1; }
                func_ov002_02259774(arg,0xb,j,result ? 6 : 4); return;
            }
        }
        j++; p++;
    } while (j < state->count); }
    }
    { int cardid, bits; struct Card *p; struct State *state; u32 j;
    j=0; if (j < *(u32 *)((char *)data_ov002_022cf178+offset)) { state=(struct State *)(data_ov002_022cf16c+offset); p=state->cards; do {
        cardid=(*p).id;
        if (func_0202e234(cardid)) {
            bits=func_ov002_0226eb5c(arg, (*p).bit13 + ((*p).slot << 1), 1, data_ov002_022cd300.mode);
            if (bits) {
                result=func_ov002_0227b960(arg,cardid,0,0);
                if (result) { if (!(bits & 0x40)) result=0; }
                if (!result) { if (!(bits & 0x10)) result=1; }
                func_ov002_02259774(arg,0xb,j,result ? 6 : 4); return;
            }
        }
        j++; p++;
    } while (j < state->count); }
    }
}


