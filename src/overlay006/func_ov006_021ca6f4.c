typedef struct { unsigned int a,b; char pad[0x14]; struct { unsigned int low8:8; unsigned int :24; }; char pad2[4]; struct { unsigned int :17; unsigned int mid4:4; unsigned int :11; }; } state_t;
typedef struct { char pad[0x18]; unsigned int f18; char pad1[4]; unsigned int f20; } state_02001d98_t;
typedef struct { unsigned int f0,f4; } Dims02001e94;
typedef struct { short kind, type, a, b, x, y, w, h, text, text2; } Entry;
typedef struct { char pad[4]; state_t state; char pad38[0x14]; int tile, palette, pad48, index, arg, pad54, width, height, count; } Self;
extern struct { int pad; unsigned int mode:3; unsigned int :29; } data_02104f4c;
extern char data_ov006_021cec04[];
extern char data_020b4728[];
extern void func_02001d0c(state_t *, int, int);
extern void func_02001d68(int);
extern void func_02001d98(state_02001d98_t *, int);
extern void func_02001e94(Dims02001e94 *, unsigned short *, int, int);
extern void func_02005088(int,int,int,int,int,int);
extern int func_02005554(int,int,int);
extern int func_0202b100(int);
extern int func_0202c0c0(int);
extern int func_0208de4c(void);
extern int func_0208e0a0(void);
extern void func_0208ff84(void *,int,unsigned int);
extern void func_02094504(int,int,int);
extern int func_020a978c(char *, const char *, ...);
int func_ov006_021ca6f4(Self *self) {
    char buf[256];
    Entry *entry;
    short *ids;
    int i, count, offset, xpos, text, x, y, dst, tiles;
    int buttons;
    if (data_02104f4c.mode == 0) entry = (Entry *)(data_ov006_021cec04 + 6) + self->index;
    else entry = (Entry *)(data_ov006_021cec04 + 0x24a) + self->index;
    x = (entry->x + entry->w + 7) / 8;
    y = (entry->y + entry->h + 7) / 8;
    func_02094504(0, func_0208e0a0(), 0x800);
    func_02001d0c(&self->state, x, y);
    func_02001e94((Dims02001e94 *)&self->state, (unsigned short *)func_0208e0a0(), self->tile, self->palette);
    dst = func_0208de4c() + self->tile * 32;
    tiles = x * y;
    func_02094504(0, dst, tiles * 32);
    text = 0;
    if (entry->text) {
        text = func_0202c0c0(entry->text);
        if (entry->type == 1) func_020a978c(buf, (char *)text, func_0202b100(self->arg));
        else if (entry->type == 2) func_020a978c(buf, (char *)text, self->arg + 1);
        else func_020a978c(buf, (char *)text);
        text = (int)buf;
    }
    if (text) {
        if (entry->type == 2) func_02001d68(*(unsigned char *)self->arg);
        else func_02001d68(data_02104f4c.mode);
        func_02001d98((state_02001d98_t *)&self->state, 5);
        func_02005088((int)&self->state,text,dst,entry->x,entry->y,12);
        func_02001d98((state_02001d98_t *)&self->state,-1);
    }
    text = 0;
    if (entry->text2) text = func_0202c0c0(entry->text2);
    if (text) {
        func_02001d68(data_02104f4c.mode);
        func_02001d98((state_02001d98_t *)&self->state,5);
        func_02005088((int)&self->state,text,dst,entry->x,entry->y,12);
        func_02001d98((state_02001d98_t *)&self->state,-1);
    }
    if (entry->kind) {
        func_02001d0c(&self->state,32,4);
        func_02001e94((Dims02001e94 *)&self->state,(unsigned short *)(func_0208e0a0() + (self->height - 4) * 64), self->tile + tiles,self->palette);
        buttons = func_0208de4c() + (self->tile + tiles) * 32;
        func_02094504(0,buttons,0x1000);
        count = self->count;
        if (entry->kind == 1) ids = (short *)(data_ov006_021cec04 + 2);
        else if (entry->kind == 2) ids = (short *)data_ov006_021cec04;
        else ids = 0;
        for (i=0; i<count; i++) {
            text = func_0202c0c0(ids[i]);
            int length = func_02005554(text,12,5);
            int center = (self->width * 8) / 2 - length / 2;
            xpos = center + ((1 - count + i * 2) * 64) / 2;
            func_02001d98((state_02001d98_t *)&self->state,5);
            func_02005088((int)&self->state,text,buttons,xpos,5,12);
            func_02001d98((state_02001d98_t *)&self->state,-1);
        }
    }
    func_0208ff84(data_020b4728,self->palette * 32,32);
    return 1;
}















