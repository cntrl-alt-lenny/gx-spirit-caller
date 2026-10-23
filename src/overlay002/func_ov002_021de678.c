typedef unsigned int u32;
typedef unsigned short u16;
struct Arg { u16 value; u16 side:1; u16 pad:13; u16 flip:1; u16 last:1; };
extern u32 func_ov002_021de134(struct Arg *arg, u32 mask, int kind, int flags);
extern void func_ov002_021e276c(void *self, int a, int b, int c);
struct Entry { u16 id; u16 type:4; u16 param:4; u16 rest:8; u16 unused; u16 next; };
struct Slot { u32 id:13; u32 flag:1; u32 pad:8; u32 value:8; u32 rest:2; char unused[16]; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a6[];
extern struct Entry data_ov002_022d0650[];
int func_ov002_021de678(struct Arg *arg, int side, int index, int flags)
{
    u32 mask = 1 << (index + (side << 4));
    if (mask & func_ov002_021de134(arg, mask, 15, flags)) {
        u16 next = *(u16 *)(data_ov002_022cf1a6 + (side & 1) * 0x868 + index * 20);
        while (next != 0) {
            struct Entry *entry = &data_ov002_022d0650[next];
            u32 type = entry->type;
            next = entry->next;
            if (type < 6) {
                switch (entry->id) {
                case 0x17d2: case 0x17d5: case 0x1814: case 0x1822:
                case 0x185e: case 0x18af: case 0x1a1f: case 0x1a20:
                case 0x1a21: case 0x1ad7: case 0x1ad8:
                    {
                        struct Slot *slot = (struct Slot *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x30 + index * 20);
                        func_ov002_021e276c((void *)side, entry->id, (u16)((type & 15) | ((unsigned char)(entry->param & 15) << 4)), (u16)(slot->value * 2 + slot->flag));
                    }
                    break;
                }
            }
        }
        return 1;
    }
    return 0;
}

