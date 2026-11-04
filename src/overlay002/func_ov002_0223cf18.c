typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { u32 id:13; u32 bit:1; u32 pad:8; u32 value:8; u32 top:2; } Card;
struct Player { char pad[0x260]; Card cards[128]; char tail[0x408]; };
struct State { char pad[0x494]; int start; u16 entries[128]; char gap[0x114]; u32 count; };
extern char data_ov002_022cf16c[];
extern struct State data_ov002_022ce288;
extern int func_ov002_021bd85c(int a, int b);
extern int func_ov002_0223b5cc(int arg0, int arg1);
int func_ov002_0223cf18(int player, int kind, int slot)
{
    int value; int id; int i; u32 start; u32 count;
    if (kind == 13) {
        u32 base = (u32)data_ov002_022cf16c + (player & 1) * 0x868;
        Card *card = (Card *)(base + 0x260); card += slot; id = card->id; value = card->value * 2 + card->bit;
        if (func_ov002_021bd85c(id, value) != 0) return 0;
        if (func_ov002_0223b5cc(id, 0) == 0) return 0;
    } else {
        return 0;
    }
    count = data_ov002_022ce288.count; i = 0; if (i < count) { start = data_ov002_022ce288.start; do { if (value == data_ov002_022ce288.entries[(start + i) & 0x7f]) return 0; i++; } while (i < count); }
    return 0x800;
}
