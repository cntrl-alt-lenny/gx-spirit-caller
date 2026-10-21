typedef unsigned int u32;
typedef unsigned short u16;
struct Obj1074c {
    u16 id;
    u16 a:1;
    u16 index:5;
    u16 rest:10;
    u16 low:6;
    u16 value:9;
    u16 high:1;
};
typedef struct {
    u32 low:13;
    u32 bit:1;
    u32 middle:8;
    u32 value:8;
    u32 high:2;
} Entry;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_02257b48(void *p, void *q);
/* The original passes q as a second argument; the current C definition ignores it. */
extern int func_ov002_0221074c(struct Obj1074c *self, void *q);
int func_ov002_0223876c(struct Obj1074c *self, void *q)
{
    Entry *entry = (Entry *)(data_ov002_022cf16c + (self->a & 1) * 0x868 + 0x30 + self->index * 0x14);
    if (self->value != entry->value * 2 + entry->bit) return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + (self->a & 1) * 0x868 + self->index * 0x14) == 0) return 0;
    if (func_ov002_02257b48(self, q) == 0) return 0;
    return func_ov002_0221074c(self, q);
}


