typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 side:1; u16 index:4; u16 key:9; u16 rest:2; } Slot;
struct Node { char pad[8]; Slot slots[5]; u16 start; };
typedef struct { u32 pad:13; u32 low:1; u32 pad2:8; u32 high:8; u32 pad3:2; } Info;
struct Entry { Info info; char pad[16]; };
struct Group { char pad[48]; struct Entry entries[11]; char tail[1884]; };
extern Slot data_ov002_022ce720[];
extern struct Group data_ov002_022cf16c[];
void func_ov002_0223e080(struct Node *self, int index) {
    Slot *p;
    unsigned n;
    unsigned key;
    Info *info;
    int side, i;
    if (index < 5) p = &self->slots[index];
    else p = &data_ov002_022ce720[(self->start + index - 5) % 128];
    n = p->index;
    if (n > 10) return;
    info = &data_ov002_022cf16c[p->side & 1].entries[n].info;
    if (p->key == info->high * 2 + info->low) return;
    for (side = 0; side < 2; side++) {
        for (i = 0; i <= 10; i++) {
            info = &data_ov002_022cf16c[side & 1].entries[i].info;
            if (p->key == info->high * 2 + info->low) {
                p->side = (u16)side;
                p->index = (u16)i;
                return;
            }
        }
    }
}




