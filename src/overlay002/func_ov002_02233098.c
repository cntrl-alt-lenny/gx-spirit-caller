typedef unsigned short u16;
typedef struct { u16 id; u16 side:1; u16 rest:15; u16 pad[2]; u16 count[2]; } Self;
typedef struct { char pad[0x5a8]; int state; int count; } State;
typedef struct { char pad[0xb0]; u16 value; u16 side; } Selection;
extern State data_ov002_022ce288;
extern char data_ov002_022cf178[];
extern Selection data_ov002_022d0e6c;
extern int func_ov002_02257b48(void *p, void *q);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021d71e0(int a, int b, int c);
extern void func_ov002_0226afb4(int arg0, int arg1);
extern int func_ov002_021e286c(int arg0);
int func_ov002_02233098(Self *self, void *q) {
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_02257b48(self, q) == 0) return 0;
        func_ov002_021ae400(self->side, 0x1f);
        data_ov002_022ce288.count = 0;
        self->count[1] = 0;
        self->count[0] = 0;
        return 0x7f;
    case 0x7f:
        if (*(int *)(data_ov002_022cf178 + (self->side & 1) * 0x868) == 0) return 0x7d;
        func_ov002_0226afb4(self->side, self->id);
        return 0x7e;
    case 0x7e:
        func_ov002_021d71e0(self->side, data_ov002_022d0e6c.value, 0);
        self->count[data_ov002_022d0e6c.side & 1]++;
        data_ov002_022ce288.count++;
        if (data_ov002_022ce288.count < 2) return 0x7f;
        return 0x7d;
    case 0x7d:
        if (self->count[self->side]) func_ov002_021e286c(self->side);
        if (self->count[1-self->side]) func_ov002_021e286c(1-self->side);
        return 0;
    }
    return 0;
}


