typedef unsigned short u16;
typedef unsigned int u32;
struct Self { u16 id; u16 side:1; u16 index:5; u16 rest:10; };
struct State { char pad[0x5a8]; int state; int selected; };
struct Slot { u32 id:13; u32 flag:1; u32 pad:8; u32 sub:8; u32 end:2; };
struct Player { char pad[0x120]; struct Slot slots[466]; };
extern struct State data_ov002_022ce288;
extern int data_ov002_022cd744[];
extern char data_ov002_022d016c[];
extern char data_ov002_022d0e6c[];
extern struct Player data_ov002_022cf16c[];
extern int func_ov002_02257594(void *arg0, int arg1);
extern int func_ov002_022107b4(int a, int b, int c);
extern int func_ov002_02290500(int a, int b, int (*c)(int,int,int));
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern int func_ov002_021e278c(int arg0, int arg1);
/* The original omits the definition's unused third argument. */
extern int func_ov002_0226b258();
extern void func_ov002_021d7c1c(void *a, void *b, void *c);
extern int func_ov002_021d5ca4(int arg0, int arg1, int arg2);
extern int func_ov002_021d5a6c(int arg0, int arg1, int arg2, int arg3);
int func_ov002_02232004(struct Self *self, int arg1) {
    int selected, mode, value;
    struct Slot *slot;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_02257594(self, arg1) == 0) return 0;
        if (data_ov002_022cd744[self->side] == 1) {
            func_ov002_02290500(self->side, self->id, func_ov002_022107b4);
        } else {
            func_ov002_021ae400(self->side, 0x49);
            func_ov002_022592ec((int)func_ov002_022107b4);
        }
        return 0x7f;
    case 0x7f:
        if (func_ov002_022593f4() == 0) return 0x80;
        selected = *(int *)(data_ov002_022d016c + 0xd78);
        data_ov002_022ce288.selected = selected;
        slot = &data_ov002_022cf16c[self->side & 1].slots[selected];
        func_ov002_021e278c(self->side, slot->sub * 2 + slot->flag);
        return 0x7e;
    case 0x7e:
        func_ov002_0226b258(self->side, self->index);
        return 0x7d;
    case 0x7d:
        mode = *(u16 *)(data_ov002_022d0e6c + 0xb0);
        if (mode == 1) {
            func_ov002_021d7c1c(self->side, &data_ov002_022cf16c[self->side & 1].slots[data_ov002_022ce288.selected], 0);
        } else {
            slot = &data_ov002_022cf16c[self->side & 1].slots[data_ov002_022ce288.selected];
            value = slot->sub * 2 + slot->flag;
            func_ov002_021d5ca4(value, self->id, 1);
            func_ov002_021d5a6c(value, self->id, 1, (u16)mode);
        }
        return 0;
    }
    return 0;
}
