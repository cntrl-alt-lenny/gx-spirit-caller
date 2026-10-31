typedef struct {
    unsigned int a, b;
    unsigned char _pad8[0x14];
    struct { unsigned int low8:8; unsigned int :24; };
    unsigned char _pad20[4];
    struct { unsigned int :17; unsigned int mid4:4; unsigned int :11; };
} state_t;
typedef struct { unsigned int unk; unsigned int mode:3; unsigned int rest:29; } GlobalState;
typedef struct { char pad[8]; unsigned int type; char pad2[0x3c]; signed char text[0x20]; } State;
extern state_t data_02102c90;
extern GlobalState data_02104f4c;
extern int func_0208de4c(void);
extern void func_02094504(int value, void *dest, int size);
extern void func_02001d0c(state_t *p, int a, int b);
extern void func_02004f58(int a, int b, int c, int d, int e, int f);
static inline int small(State *p) {
    int r=0;
    if(p->type <= 4 && ((1U << p->type) & 0x19)) r=1;
    return r;
}
void func_ov005_021aef74(State *p) {
    int buffer=func_0208de4c();
    unsigned short x=small(p) ? 12 : 0;
    int i;
    func_02094504(0, (void *)(buffer+0x40), 0x4c0);
    func_02001d0c(&data_02102c90, 0x13, 2);
    if(data_02104f4c.mode != 0) {
        for(i=0; i<(small(p) ? 10 : 12)*2; i++) {
            if(p->text[i] != 0x20) break;
            x += 6;
        }
    }
    func_02004f58((int)&data_02102c90, (int)p->text, buffer+0x40, x+1, 4, 12);
}
