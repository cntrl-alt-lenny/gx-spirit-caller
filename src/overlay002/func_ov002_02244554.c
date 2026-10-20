typedef unsigned short u16;
typedef unsigned int u32;
struct SelfDE04 {
    u16 id;
    u16 side : 1;
    u16 pad : 13;
    u16 flip : 1;
    u16 rest : 1;
};
struct Key { u32 id : 13; u32 b : 1; u32 pad : 8; u32 a : 8; u32 rest : 2; };
struct Node0223def4;
struct State { char pad[0x5b4]; int state; };
extern struct State data_ov002_022ce288;
struct Entry { u16 id : 13; u16 rest : 3; u16 extra; };
extern struct Entry data_ov002_022d0250[];
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021afba0(void);
extern void func_ov002_0223de04(struct SelfDE04 *self, int arg1, int arg2, int arg3);
extern int func_ov002_0223def4(struct Node0223def4 *self, int idx);
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
extern int func_ov002_02257ca8(void *arg0, int arg1);
int func_ov002_02244554(struct SelfDE04 *self, int arg1) {
    int side = self->side ^ self->flip;
    switch (data_ov002_022ce288.state) {
    case 0:
        if (func_ov002_022536e8((void *)side, self->id, 0) == 0) return 1;
        func_ov002_021ae400(side, 0x5e);
        data_ov002_022ce288.state++;
        return 0;
    case 1:
        func_ov002_021af9d0(side, 6, self->id, 0);
        data_ov002_022ce288.state++;
        return 0;
    case 2: {
        struct Key *a = (struct Key *)func_ov002_021afb74();
        int b = func_ov002_021afba0();
        struct Key *c = (struct Key *)func_ov002_021afb74();
        struct Key *d = (struct Key *)func_ov002_021afb74();
        func_ov002_0223de04(self, a->b, b, d->a * 2 + c->b);
        data_ov002_022ce288.state++;
        return 0;
    }
    case 3:
        self->id = data_ov002_022d0250[func_ov002_0223def4((struct Node0223def4 *)self, 0)].id;
        side = func_ov002_02257ca8(self, arg1);
        self->id = 0x1935;
        if (side == 0) return 0;
        data_ov002_022ce288.state = 0;
        return 1;
    default:
        return 1;
    }
}


