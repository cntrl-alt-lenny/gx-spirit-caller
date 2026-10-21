typedef unsigned short u16;
typedef unsigned int u32;
struct Card { u16 pad0; u16 side:1; u16 rest:15; char pad4[8]; u16 cost; };
struct Bits { u32 id:13; u32 rest:19; };
/* The original call supplies only two arguments to this four-parameter thunk. */
extern int func_ov002_021c84e0();
extern int func_ov002_021f27b4(struct Card *, int, int);
extern int func_ov002_02257ab8(int a, int b);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
int func_ov002_021f2e0c(struct Card *card, int player, int idx)
{
    int off;
    int off2;
    int result;
    if (card->cost != 0) {
        if (idx >= 5) return 0;
        if (player == card->side) return 0;
        off = (player & 1) * 0x868;
        off2 = idx * 0x14;
        if (((struct Bits *)(data_ov002_022cf16c + off + 0x30 + off2))->id != 0) {
            if (*(u16 *)(data_ov002_022cf1a4 + off + off2) == 0 ||
                func_ov002_021c84e0(player, idx) < card->cost) return 1;
            return 0;
        }
        return 0;
    }
    if (func_ov002_021f27b4(card, player, idx) != 0) {
        card->cost = func_ov002_021c84e0(player, idx);
        result = func_ov002_02257ab8((int)card, 1-player) > 0;
        card->cost = 0;
        return result;
    }
    return 0;
}

