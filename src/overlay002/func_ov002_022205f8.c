typedef unsigned short u16;
struct Node;
struct node;
typedef struct { u16 id; u16 side:1; u16 pad2:15; u16 pad4:2; u16 blocked:1; u16 rest:13; } Self;
typedef struct { char pad[0x5a8]; int state; } State;
typedef struct { char pad[0x1c]; int value; } Global;
extern State data_ov002_022ce288;
extern Global data_ov002_022cd3f4;
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern void func_ov002_021d479c(u16 a0, u16 a1, u16 a2, u16 a3);
extern int func_ov002_0226b204(unsigned int arg);
int func_ov002_022205f8(Self *self, int unused1) {
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (self->blocked) return 0;
        if (func_ov002_0223df38((struct Node *)self, 0, 0)) {
            int result = func_ov002_0223de94((struct node *)self, 0);
            int low = result & 0xff;
            int high = ((int)(u16)result >> 8) & 0xff;
            func_ov002_021d479c((1 - self->side ? 0x8000 : 0) | 0x19, data_ov002_022cd3f4.value, high, low);
            return 0x7f;
        }
        return 0;
    case 0x7f:
        func_ov002_0226b204(1);
        return 0;
    }
    return 0;
}
