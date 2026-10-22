typedef unsigned short u16;
typedef unsigned int u32;
struct Self {
 u16 id;
 u16 side:1; u16 index:5; u16 rest2:10;
 u16 rest4:6; u16 value:9; u16 pad4:1;
 char pad6[14];
 u32 rest14:9; u32 flag:1; u32 field:4; u32 tail:18;
};
struct Slot { u32 lo:13; u32 bit:1; u32 pad:8; u32 hi:8; u32 tail:2; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_02257594(void *arg0, int arg1);
extern int func_ov002_021de4b0(int arg0, int arg1, int arg2);
int func_ov002_0221ad08(struct Self *self, int arg1) {
 struct Slot *slot = (struct Slot *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x30 + self->index * 20);
 if (self->value != slot->bit + (slot->hi << 1)) return 0;
 if (*(u16 *)(data_ov002_022cf1a4 + (self->side & 1) * 0x868 + self->index * 20) == 0) return 0;
 if (func_ov002_02257594(self, arg1) == 0) return 0;
 func_ov002_021de4b0((int)self, self->flag, self->field);
 return 0;
}

