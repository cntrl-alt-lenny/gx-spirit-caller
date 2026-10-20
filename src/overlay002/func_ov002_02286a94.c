typedef unsigned short u16;
typedef unsigned int u32;
struct Self { char pad[2]; u16 player:1; u16 rest:15; char pad4[0x10]; u32 value:16; u32 rest14:16; };
extern char data_ov002_022cf16c[];
int func_ov002_02286a94(struct Self *self) {
    u32 value = self->value;
    u32 limit = *(u32 *)(data_ov002_022cf16c + (self->player & 1) * 0x868);
    if (value >= limit) return 1;
    return value >= 0x5dc;
}
