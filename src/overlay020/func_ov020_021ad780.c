typedef struct { unsigned int control; char pad[0x68]; unsigned short brightness; } Display;
typedef unsigned short u16;
typedef struct { int index; u16 first,last,previous,other,pad0c,saved; int pad10; int active; } State;
typedef struct { u16 a,b,flags,d; } Entry;
extern char data_ov020_021ae0a8[];
extern char data_ov020_021ae0e8[];
extern void func_0207ec68(State *s);
extern void func_0207ed94(State *s);
extern int func_0207f05c(State *s, void *p, u16 count);
extern void func_0208c884(unsigned short *a0, int a1);
extern int func_020b3870(int num, int den);
extern int func_ov020_021ab5c4(int count, void *a, Entry **out);
extern int func_ov020_021ab81c(int a0, int *a1);

static inline void setPlanes(int planes) {
    *(volatile unsigned int *)0x04000000 = (*(volatile unsigned int *)0x04000000 & ~0x1f00) | (planes << 8);
}
int func_ov020_021ad780(void) {
    char *base = data_ov020_021ae0a8;
    int done = 0;
    int out[2];
    int counts[2] = {0,0};
    int i;
    char *state = data_ov020_021ae0e8;
    char *entries;
    char *dest;
    int brightness;
    unsigned int control;
    Display *display = (Display *)0x04000000;
    for (i=0;i<2;i++) {
        func_0207ed94((State *)state);
        func_0207ec68((State *)state);
        state += 0x41c;
    }
    out[0] = (int)(base+0x5c);
    out[1] = (int)(base+0x478);
    counts[0] += func_ov020_021ab81c((int)(base+0x40),out);
    counts[1] += func_ov020_021ab5c4(9,base+0x45c,(Entry **)&out[1]);
    entries=base+0x5c;
    dest=base+0x40;
    for (i=0;i<2;i++) {
        if(counts[i]>0) func_0207f05c((State *)dest,entries,(u16)counts[i]);
        entries+=0x41c;
        dest+=0x41c;
    }
    *(int *)(base+0x87c) -= 0x1000;
    if (*(int *)(base+0x87c)<0) *(int *)(base+0x87c)=0;
    control = *(int *)(base+0x87c);
    brightness=-16-func_020b3870(-(control<<4),*(int *)(base+0x878));
    func_0208c884((u16 *)0x0400006c,brightness);
    func_0208c884((u16 *)0x0400106c,brightness);
    if (!*(int *)(base+0x87c)) {
        setPlanes(0);
        func_0208c884(&display->brightness,-16);
        *(volatile unsigned int *)0x04001000 &= ~0x1f00;
        func_0208c884((u16 *)0x0400106c,-16);
        done=1;
    }
    return done;
}












