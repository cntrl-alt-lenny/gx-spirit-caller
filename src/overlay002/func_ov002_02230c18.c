typedef unsigned short u16;
typedef unsigned int u32;
struct Ov002Self { u16 f0; u16 b0:1; u16 pad:15; u16 low:6; u16 key:9; u16 high:1; };
struct Flags { u32 id:13; u32 bit:1; u32 pad:8; u32 value:8; u32 top:2; };
extern int data_ov002_022cd3f4[];
extern int data_ov002_022cd420[];
extern int data_ov002_022cd424[];
extern int data_ov002_022cd42c[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a2[];
extern int func_ov002_021d6808(struct Ov002Self *self, int player, int idx, int arg3, int arg4);
int func_ov002_02230c18(struct Ov002Self *self) {
    int which;
    if (data_ov002_022cd3f4[14] == self->key) which = 1; else which = 0;
    int player = *(int *)((char *)data_ov002_022cd420 + which * 0x38);
    int idx = *(int *)((char *)data_ov002_022cd424 + which * 0x38);
    struct Flags *f = (struct Flags *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30 + idx * 20);
    if (*(int *)((char *)data_ov002_022cd42c + which * 0x38) == f->value * 2 + f->bit) {
        if (*(u16 *)(data_ov002_022cf1a2 + (player & 1) * 0x868 + idx * 20) == 0)
            func_ov002_021d6808(self, player, idx, 0, 1);
    }
    return 0;
}



