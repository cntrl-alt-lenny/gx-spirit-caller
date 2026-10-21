typedef unsigned short u16;
struct Self {
    u16 id;
    struct { u16 player:1; u16 index:5; u16 rest:10; } f2;
    struct { u16 a:2; u16 disabled:1; u16 b:3; u16 value:9; u16 c:1; } f4;
};
struct Record { unsigned int a:13; unsigned int low:1; unsigned int b:8; unsigned int high:8; unsigned int c:2; char pad[16]; };
struct Table { char pad[0x30]; struct Record records[24]; char tail[0x658]; };
extern struct Table data_ov002_022cf16c[];
extern int data_ov002_022cf178[];
extern int data_ov002_022d016c[];
extern int func_ov002_021b4120(int arg0, int arg1, int arg2);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
/* This caller supplies two arguments; the thunk overwrites r2. */
extern int func_ov002_021e104c();
extern void func_ov002_0226af38(int arg0, int arg1, int arg2);
int func_ov002_0222427c(struct Self *self) {
    if (self->f4.disabled) return 0;
    if (self->f4.value != (data_ov002_022cf16c[self->f2.player & 1].records[self->f2.index].high * 2 + data_ov002_022cf16c[self->f2.player & 1].records[self->f2.index].low)) return 0;
    if (data_ov002_022d016c[0xcec / 4] != self->f2.player) {
        int n = 4 - *(int *)((char *)data_ov002_022cf178 + (self->f2.player & 1) * 0x868);
        if (n != 0 && func_ov002_021e104c(self->f2.player, n) != 0)
            func_ov002_021d59cc(self->f2.player, self->f2.index, self->id, 0x11, (u16)n);
    } else {
        int n = func_ov002_021b4120(self->f2.player, self->f2.index, self->id);
        if (n > 0) func_ov002_0226af38(self->f2.player, 0, n);
    }
    return 0;
}

