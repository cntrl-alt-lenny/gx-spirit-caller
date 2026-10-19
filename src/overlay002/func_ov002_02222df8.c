typedef unsigned short u16;
struct Self {
    u16 id;
    u16 side:1;
    u16 index:5;
    u16 pad2:10;
    u16 pad4:6;
    u16 value:9;
    u16 pad5:1;
};
struct State { char pad[0x5a8]; int mode; };
struct Row {
    unsigned int pad0:13;
    unsigned int low:1;
    unsigned int pad1:8;
    unsigned int high:8;
    unsigned int pad2:2;
    char pad[0x10];
};
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern void func_ov002_021afb64(void *p);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021de9d4(int a, int b, int c);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern int func_ov002_02257b48(void *p, void *q);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
int func_ov002_02222df8(struct Self *self, void *q) {
    switch (data_ov002_022ce288.mode) {
    case 0x80: {
        struct Row *row = (struct Row *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x30);
        if (self->value != row[self->index].high * 2 + row[self->index].low)
            return 0;
        if (func_ov002_02257b48(self, q) == 0)
            return 0;
        func_ov002_021de9d4((int)self, self->side, self->index);
        return 0x7f;
    }
    case 0x7f: {
        int *p;
        func_ov002_0225368c(self->side, self->id, 0);
        func_ov002_021afb64(0);
        p = func_ov002_021afb74();
        func_ov002_0227adb8(self->side, (int)p, 1, 0);
        return 0;
    }
    }
    return 0;
}
