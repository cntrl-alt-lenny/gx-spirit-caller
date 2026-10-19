typedef struct {
    unsigned int a, b;
    unsigned char pad8[0x14];
    struct { unsigned int low8:8; unsigned int:24; };
    unsigned char pad20[4];
    struct { unsigned int:17; unsigned int mid4:4; unsigned int:11; };
} state_t;
struct Self { char pad[0x1c]; int entries[4]; int index; int f30; int f34; };
extern state_t data_02102c90;
extern int Task_PostLocked(void *arg0, int arg1, int arg2);
extern void Task_InvokeLocked(void *p);
extern void func_02001d0c(state_t *p, int a, int b);
extern void func_02005088(int a0, int a1, int a2, int a3, int a4, int a5);
extern int func_0202c0c0(int a);
extern void func_02094504(int value, void *dest, int size);
extern void func_02092904(void *p, int size);
extern void func_0208fd30(void *src, int offset, int size);
void func_ov002_022af1f0(struct Self *self) {
    char *buf;
    int i;
    int offset;
    char *cursor;

    if (self->index < 0) return;
    buf = (char *)Task_PostLocked((void *)0x300, 4, 0);
    func_02094504(0, buf, 0x300);
    func_02001d0c(&data_02102c90, 12, 2);
    func_02005088((int)&data_02102c90, func_0202c0c0(self->entries[self->index] + 0x386), (int)buf, 1, 2, 12);
    self->f34 = *(int *)((char *)&data_02102c90 + 8);
    func_02092904(buf, 0x300);
    for (i = 0, offset = 0x5c80, cursor = buf; i < 3; offset += 0x100, cursor += 0x80, i++) {
        func_0208fd30(cursor, offset, 0x80);
        func_0208fd30(cursor + 0x180, 0x5c80 + (i * 2 + 1) * 0x80, 0x80);
    }
    Task_InvokeLocked(buf);
}





