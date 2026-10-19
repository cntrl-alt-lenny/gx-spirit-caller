typedef struct {
    unsigned short pad0;
    unsigned short state;
    unsigned short kind;
    unsigned short pad6;
    char *payload;
} Event;
extern void *data_021a088c;
extern void func_0207af28(void);
extern void func_0207b038(int a0);
extern int func_0207b13c(int a, int b, int c, int d);
extern void func_0207cd34(char *a0);
extern void func_0207cdd0(int a0);
extern void func_020928cc(void *start, int size);

void func_0207a334(Event *self) {
    switch (self->state) {
    case 0:
        switch (self->kind) {
        case 0xe:
            if (*(int *)((char *)data_021a088c + 0x2260) == 0xc) {
                func_0207b038(8);
                func_0207af28();
            } else {
                func_0207b038(9);
                func_0207b13c(0, (int)((char *)data_021a088c + 0x2140), 0, 0x872);
            }
            return;
        case 0xf:
            func_0207cdd0((*(unsigned short *)(self->payload + 0xe) >> 8) & 0xff);
            func_020928cc(self->payload, 0x620);
            func_0207cd34(self->payload);
            return;
        default:
            func_0207b038(0xb);
            func_0207b13c(7, (int)((char *)data_021a088c + 0x2140), self->kind, 0x881);
            return;
        }
    case 4:
    default:
        func_0207b038(0xb);
        func_0207b13c(7, (int)((char *)data_021a088c + 0x2140), 0, 0x88c);
        return;
    }
}
