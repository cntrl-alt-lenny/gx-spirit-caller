typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
    char pad0[8];
    int dest;
    unsigned int offset;
    short palette;
    short pad12;
    unsigned short kind:4, rest14a:5, mode:1, rest14b:6;
    unsigned short width:7, height:7, fixed:1, rest16:1;
    unsigned int x:7, y:7, rest18a:12, packed:1, rest18b:5;
    unsigned int stride:8, rest1c:24;
    int field20;
    unsigned short left:8, top:8;
    unsigned short right:8, bottom:8;
} Obj;
typedef struct { char pad[10]; unsigned char type; char padb; int size; u16 width; char pad12[10]; u16 data[1]; } Data;
typedef struct { unsigned int tile:10, unused:6, attr:16; } Entry;
extern int Task_PostLocked(void *arg0, int arg1, int arg2);
extern void Task_InvokeLocked(void *p);
extern void func_02092904(void *a, int b);
extern unsigned int func_020b3a7c(unsigned int a, unsigned int b);
extern int func_0201d910(int a0, int sel, int a2, int a3);
void func_0201da1c(Obj *o, Data *d) {
    u16 *src = d->data;
    u16 *buf;
    int shift;
    int base;
    int row;
    int unit, stride;
    if (d->size == 0) return;
    buf = (u16 *)Task_PostLocked((void *)0x2000,4,0);
    shift = o->mode ? 9 : 5;
    func_02092904(src,d->size);
    base = func_020b3a7c(o->offset, (o->mode + 1) << 5);
    if (o->packed) {
        int i;
        for (i=0;i<(o->width*o->height+1)/2;i++) {
            buf[i] = (unsigned char)(base+src[i*2]) | ((unsigned char)(base+src[i*2+1])<<8);
        }
        src=buf;
    } else if (d->type == 4) {
        int i;
        for(i=0;i<o->width*o->height;i++) {
            buf[i] = ((o->palette>>shift)<<12) + (((base+((unsigned int *)src)[i])&0x3ff) | (unsigned short)(((unsigned int *)src)[i]>>16));
        }
        src=buf;
    } else if (base | o->palette) {
        int i;
        for(i=0;i<o->width*o->height;i++) {
            buf[i] = base+src[i]+((o->palette>>shift)<<12);
        }
        src=buf;
    }
    if (!o->fixed) {
        o->right=(unsigned char)o->width;
        o->bottom=(unsigned char)o->height;
    }
    if(o->width==32 && !o->fixed) {
        func_0201d910((int)src,o->kind,o->dest,o->height*(o->width*2));
    } else {
        unit=2;
        stride=32;
        if(o->packed) {unit=1;stride=o->stride;}
        for(row=0;row<o->bottom-o->top;row++) {
            func_0201d910((int)src+unit*(d->width*(row+o->top)+o->left),o->kind,
                o->dest+unit*(stride*(row+o->y)+o->x),unit*(o->right-o->left));
        }
    }
    Task_InvokeLocked(buf);
}





