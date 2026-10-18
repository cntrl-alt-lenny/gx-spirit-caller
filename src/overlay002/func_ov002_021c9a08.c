typedef unsigned int u32;

typedef struct {
    u32 first;
    u32 pad[0x868 / 4 - 1];
} Slot;

typedef struct {
    u32 pad0;
    u32 count : 13;
    u32 rest : 19;
    u32 pad1[3];
} Card;

typedef struct {
    u32 head[11];
    Card cards[105];
    char tail[0x868 - 0x2c - 105 * 0x14];
} Side;

extern Slot data_ov002_022cf178[];
extern Slot data_ov002_022cf17c[];
extern Slot data_ov002_022cf180[];
extern Slot data_ov002_022cf184[];
extern Slot data_ov002_022cf188[];
extern Side data_ov002_022cf16c[];

u32 func_ov002_021c9a08(u32 side, int kind)
{
    switch (kind) {
    case 12:
        return data_ov002_022cf184[side & 1].first;
    case 13:
        return data_ov002_022cf17c[side & 1].first;
    case 14:
        return data_ov002_022cf180[side & 1].first;
    case 15:
        return data_ov002_022cf188[side & 1].first;
    case 11:
        return data_ov002_022cf178[side & 1].first;
    }
    return data_ov002_022cf16c[side & 1].cards[kind].count != 0;
}
