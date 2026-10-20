typedef unsigned short u16;
typedef union {
    unsigned int raw;
    struct { unsigned int id:13; unsigned int bit13:1; unsigned int bit14:1; unsigned int mode:2; unsigned int rest:5; unsigned int hi:8; unsigned int top:2; } b;
} Packed;
typedef struct { u16 f0,f2,f4,f6; char pad[0x804]; int active,state; } State;
extern State data_ov002_022ce950;
extern Packed data_ov002_022cdc88[];
extern struct { unsigned short id:13; unsigned short rest:3; u16 other; } data_ov002_022d0250[];
extern char data_ov002_022cf180[];
extern int func_ov002_021b9b64(int unused0);
extern int func_ov002_021b947c(int);
extern int func_ov002_021b99b4(int player, int id);
extern void func_ov002_021c2c54(int, u16);
extern int func_ov002_0229ade0(int,int,int,int);
extern int func_ov002_0229c7f8(int);
static inline int pack(u16 hi, u16 lo) { return lo | (hi << 16); }
void func_ov002_021d2d88(void) {
    int flag = (data_ov002_022ce950.f0 & 0x8000) ? 1 : 0;
    int state = data_ov002_022ce950.state;
    int type = data_ov002_022ce950.f2;
    int slot = data_ov002_022ce950.f4;
    int id = data_ov002_022ce950.f6;
    switch(state) {
    case 0:
        {
            Packed *p = (Packed *)func_ov002_021b9b64(id);
            if(p) data_ov002_022cdc88[slot] = *p;
            else {
                Packed v = {0};
                v.b.id = data_ov002_022d0250[id].id;
                v.b.bit13 = id;
                v.b.hi = id >> 1;
                data_ov002_022cdc88[slot] = v;
            }
        }
        if(type == 0x10) {
            int pos = ((int)(u16)func_ov002_021b947c(id) >> 8) & 0xff;
            if((unsigned int)(pos - 0xe) <= 1) {
                Packed *p = (Packed *)func_ov002_021b9b64(id);
                p->b.mode = 1;
            }
            data_ov002_022ce950.active = 0;
            return;
        }
        data_ov002_022ce950.state++;
        if(type == 0xe) {
            
            if(*(int *)(data_ov002_022cf180 + (flag & 1)*0x868) - 1 != func_ov002_021b99b4(flag,id)) {
                func_ov002_021c2c54(flag,(u16)id);
                func_ov002_0229ade0(0x16,flag,type,id);
                return;
            }
        }
    case 1:
        if(func_ov002_0229c7f8(0x16) != 0) return;
        func_ov002_0229ade0(0x2d,flag,type,pack(slot,id));
        data_ov002_022ce950.state++;
        return;
    case 2:
        if(func_ov002_0229c7f8(0x2d) == 0) data_ov002_022ce950.active = 0;
        break;
    }
}



