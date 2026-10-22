typedef unsigned short u16;
struct Card { unsigned int pad:21; unsigned int flag:1; unsigned int rest:10; };
struct Self { u16 id; u16 player:1; u16 index:5; u16 pad:6; u16 mode:2; u16 rest:2; u16 pad4:6; u16 key:9; u16 rest4:1; };
extern unsigned int func_0202b878(int id);
extern int func_0202e234(int x);
extern int func_0202e270(int unused0);
extern int func_0202f9e8(int);
extern unsigned int func_ov002_021b947c(int);
extern int func_ov002_021b3ecc(int,int,int);
extern int func_ov002_021b3f0c(int,int,int);
extern int func_ov002_021b3fd8(int,int,int,int);
extern int func_ov002_021bb068(int id);
extern int func_ov002_021bae7c(int player,int id,int except);
extern int func_ov002_021bbf98(int arg0);
extern int func_ov002_021c988c(int player,int kind,int extra);
extern int func_ov002_021c97f8(int player,int kind,int extra);
extern void *func_ov002_021c93f0(int player,int kind,int extra);
extern int func_ov002_021fe9c4(int player,int id);
extern int func_ov002_021b7d54(struct Self *);
/* These four definitions say void, but the original caller tests r0. */
extern int func_ov002_021b3014(int arg0,int arg1,int arg2);
extern int func_ov002_021b3058(int arg0,int arg1,int arg2);
extern int func_ov002_021b30ac(int arg0,int arg1,int arg2);
extern int func_ov002_021b30f4(int arg0,int arg1,int arg2);
int func_ov002_021feb08(struct Self *self) {
    unsigned int loc;
    int flags;
    if (func_0202e234(self->id) && func_0202e270(self->id)) {
        loc = func_ov002_021b947c(self->key);
        if (func_0202f9e8(self->id) == 1) {
            if (func_ov002_021bb068(0x148e)) return 1;
            if (func_ov002_021bb068(0x14da)) return 1;
            if ((unsigned char)((u16)loc >> 8) <= 4 && self->mode == 1) {
                int extra = (u16)(loc >> 16);
                if ((u16)extra) {
                    if (func_ov002_021b3f0c(self->player,self->index,0x1433)) return 1;
                }
                if (!(u16)extra) {
                    if (func_ov002_021b3ecc(self->player,self->index,0x1433)) return 1;
                }
            }
        }
        if (self->mode != 2 && (unsigned char)((u16)loc >> 8) <= 4) {
            int extra = (u16)(loc >> 16);
            int kind = (unsigned char)((u16)loc >> 8);
            int argextra = (u16)extra;
            int player = (unsigned char)loc;
            if (func_ov002_021c988c(player,kind,argextra)) {
                if (func_ov002_021bb068(0x166c)) return 1;
                if (func_ov002_021b3ecc(0,11,0x12bf)) {
                    if (func_ov002_021c97f8(player,kind,argextra)) return 1;
                }
                if ((u16)extra) {
                    if (func_ov002_021b3f0c(player,kind,0x1944)) return 1;
                    if (func_ov002_021b30f4(player,kind,0x1a9b)) return 1;
                    if (func_ov002_021b3058(player,kind,0x1a6d)) return 1;
                } else {
                    if (func_ov002_021b3ecc(player,kind,0x1944)) return 1;
                    if (func_ov002_021b30ac(player,kind,0x1a9b)) return 1;
                    if (func_ov002_021b3014(player,kind,0x1a6d)) return 1;
                }
            }
        }
        if (self->index <= 4 || self->index > 10) {
            if (func_ov002_021b3fd8(self->player,11,0x1679,1)) return 1;
        }
        if (loc != 0x1000) {
            if (((struct Card *)func_ov002_021c93f0((unsigned char)loc,(unsigned char)((u16)loc >> 8),(u16)(loc >> 16)))->flag) return 1;
        }
    } else {
        if (func_0202b878(self->id) == 0x17) {
            unsigned int other = func_ov002_021b947c(self->key);
            if (other != 0x1000) {
                if (((struct Card *)func_ov002_021c93f0((unsigned char)other,(unsigned char)((u16)other >> 8),(u16)(other >> 16)))->flag) return 1;
            }
        }
    }
    if (self->index <= 10) {
        if (func_ov002_021bbf98(self->player) == 3) {
            if (func_ov002_021bae7c(1-self->player,0x1955,-1)) return 1;
        }
    }
    if (!func_0202e234(self->id)) {
        if (func_ov002_021b3fd8(self->player,11,0x1679,2)) return 1;
    }
    if ((self->index >= 5 && self->index <= 10) || self->mode == 0) {
        if (func_ov002_021fe9c4(self->player,self->id)) return 1;
    }
    if (func_ov002_021bb068(0x159d) && self->id != 0x15ac) {
        flags = func_ov002_021b7d54(self);
        if (flags & 1) {
            if (!func_ov002_021bae7c(self->player,0x158b,-1)) return 1;
        }
        if (flags & 2) {
            if (!func_ov002_021bae7c(1-self->player,0x158b,-1)) return 1;
        }
    }
    if (self->mode == 2 && self->index == 14) {
        if (func_ov002_021bb068(0x17b9)) return 1;
    }
    return 0;
}







