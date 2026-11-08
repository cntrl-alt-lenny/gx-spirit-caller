typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 priority:2, rest:14; } BgControl;
typedef struct { int index; u16 first,last,previous,start,end,saved; int pad10,active; } State;
typedef struct { char pad0[8]; int mode,state,trigger; void (*callback)(int); int target; short rectX,rectY; u16 rectW,rectH; } Widget;
struct Entry { int a,b; };
typedef struct { char pad[0x70]; u32 flags; } Window;
typedef struct { int state; char pad04[0x14]; State bank; char pad30[4]; Window *window; char pad38[0xc8]; u32 flags; } Overlay;
typedef struct { char pad[0x64]; int value; } Global;
extern Overlay data_ov010_021b9890;
extern Global data_ov010_021b8d44;
extern State data_ov010_021b98a8;
extern Widget data_ov010_021b98cc;
extern struct Entry data_ov010_021b9bec[];
extern int func_0208c844(volatile u16 *value);
extern void func_0208c884(u16 *a0,int a1);
extern void func_0207ed94(State *s);
extern void func_0207ec68(State *s);
extern int func_0207f05c(State *s,struct Entry *entries,u16 count);
extern int func_ov010_021b6c4c(struct Entry **out);
extern int func_ov010_021b2924(Widget *self,void *rngArg,int arg2);
int func_ov010_021b7d60(void) {
    int total = 0;
    struct Entry *out = data_ov010_021b9bec;
    Overlay *p = &data_ov010_021b9890;
    int brightness = func_0208c844((volatile u16 *)0x0400006c);

    *(volatile u32 *)0x04001000 = (*(volatile u32 *)0x04001000 & ~0x1f00) | 0x1f00;
    ((volatile BgControl *)0x04001008)->priority = 2;
    ((volatile BgControl *)0x0400100a)->priority = 0;
    ((volatile BgControl *)0x0400100c)->priority = 1;
    ((volatile BgControl *)0x0400100e)->priority = 3;
    *(volatile u32 *)0x04001010 = 0x1dc0000;
    *(volatile u32 *)0x04001014 = 0;
    *(volatile u32 *)0x04001018 = 0;
    *(volatile u32 *)0x0400101c = 0;
    *(volatile u32 *)0x04001000 |= 0x10000;
    func_0207ed94(&data_ov010_021b98a8);
    func_0207ec68(&data_ov010_021b98a8);
    total += func_ov010_021b6c4c(&out);
    total += func_ov010_021b2924(&data_ov010_021b98cc,&data_ov010_021b98a8,(int)&out);
    if (total > 0) func_0207f05c(&p->bank,data_ov010_021b9bec,(u16)total);
    func_0208c884((u16 *)0x0400106c,brightness);
    if (data_ov010_021b8d44.value == 0) {
        int newState = 2;
        p->window->flags &= ~2;
        p->flags &= ~1;
        p->state = newState;
    }
    return 1;
}



