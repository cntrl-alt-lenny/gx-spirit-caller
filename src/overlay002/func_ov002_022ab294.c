typedef struct { unsigned int a,b; unsigned char pad8[0x14]; struct { unsigned int low8:8; unsigned int:24; }; unsigned char pad20[4]; struct { unsigned int:17; unsigned int mid4:4; unsigned int:11; }; } state_t;
typedef struct { char pad[0x24]; unsigned int f24; } Arg_02005188;
extern void func_02001d0c(state_t *p,int a,int b);
extern void func_02005188(Arg_02005188 *a0,int a1,int a2,int a3,int a4,int a5);
extern char *func_0202b7cc(int idx);
extern void *Vram_GetBankBaseCD(void);
extern void *func_0208e200(void);
extern void func_02094504(int value,void *dest,int size);
extern int func_ov002_021b00e8(int player,int type);
extern unsigned char data_02102c90[];
extern struct { int f0; unsigned int :3; unsigned int mode:2; unsigned int :27; } data_02104f4c;
extern struct { int f0; int f4; } data_ov002_022cd73c;
typedef struct { unsigned short player:1; unsigned short type:5; unsigned short :10; } Input;
void func_ov002_022ab294(int *self,Input *input) {
    int band;
    int index;
    int same;
    int player, type;
    unsigned short key;
    char *base;
    unsigned short *dest;
    int y,x,tile;
    band = (int)data_02104f4c.mode / 2 ? 22 : 0;
    player = input->player;
    type = input->type;
    same = (data_ov002_022cd73c.f4 ^ 1) == player;
    index = same + (type - 12) * 2;
    key = (unsigned char)(index + 10) | ((unsigned char)func_ov002_021b00e8(player,type) << 8);
    if (*self == -key) return;
    *self = -key;
    base = Vram_GetBankBaseCD();
    func_02001d0c((state_t *)data_02102c90,62,2);
    func_02094504(0,base+64,0x1f00);
    func_02005188((Arg_02005188 *)data_02102c90,(int)func_0202b7cc(index+0x246),(int)(base+64),1,3,12);
    dest = (unsigned short *)((char *)func_0208e200() + band*64);
    tile = 1;
    for(y=0;y<2;y++) {
        for(x=0;x<32;x++) *dest++ = tile++;
        tile += 30;
    }
    self[4]=0;
    self[6]=0;
    self[5]=0;
}

