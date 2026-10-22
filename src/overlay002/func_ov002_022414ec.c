typedef unsigned short u16;
typedef unsigned int u32;
struct Self { u16 id; u16 player:1; u16 rest:15; char pad[16]; unsigned unused:18; unsigned amount:2; unsigned tail:12; };
struct SelfDE04;
struct State { char pad[0x5b8]; int state; unsigned count; };
struct Slot { unsigned pad:13; unsigned side:1; unsigned mid:8; unsigned index:8; unsigned end:2; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022d016c[];
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int player, int phase, int card, int arg);
extern int func_ov002_021afba0(void);
extern void func_ov002_021afffc(int id);
extern u32 *func_ov002_021b004c(int id);
extern int func_ov002_021bc618(int arg0);
extern void func_ov002_0223de04(struct SelfDE04 *self, int arg1, int arg2, int arg3);
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
extern int func_ov002_02257b48(void *p, void *q);
extern void func_ov002_0229cf10(char *dst, const char *fmt, int val);
int func_ov002_022414ec(struct Self *self, void *arg) {
    char buf[256];
    int phase;
    int fmt = 0x37;
    struct Slot *slot;
    int value;
    switch (self->id) {
    case 0x1359: phase=0x2a; break;
    case 0x156a: fmt=0x11d; phase=8; break;
    case 0x148b: case 0x1714: case 0x17f1: case 0x1974: case 0x1a26: phase=8; break;
    case 0x149e: fmt=0x5a; phase=9; break;
    case 0x14e7: case 0x1630: fmt=0x4e; phase=8; break;
    case 0x16a8: case 0x17f7: fmt=0x4c; phase=8; break;
    case 0x16d6: fmt=0x116; phase=8; break;
    case 0x1788:
        value=func_ov002_021bc618(self->player)>4 ? 4 : func_ov002_021bc618(self->player);
        fmt=0x11d;
        phase=(value>=32 ? 32 : value)+0x27;
        break;
    case 0x1864: phase=(self->amount>=32 ? 32 : self->amount)+6; break;
    case 0x196f: fmt=0x4c; phase=0xb; break;
    case 0x1b1d: fmt=0x5a; phase=0x2a; break;
    case 0x1b22: fmt=0x4c; phase=0x2a; break;
    case 0x1b62: fmt=0x4e; phase=8; break;
    }
    switch (data_ov002_022ce288.state) {
    case 0:
        if (phase>=6 && phase<=0x26) {
            if (func_ov002_022536e8((void *)self->player,self->id,0)<phase-6) return 1;
        }
        if (!func_ov002_02257b48(self,arg)) return 1;
        func_ov002_0229cf10(buf,(const char *)fmt,phase-6);
        func_ov002_021ae400(self->player,(int)buf);
        data_ov002_022ce288.state++;
        return 0;
    case 1:
        func_ov002_021af9d0(self->player,phase,self->id,0);
        data_ov002_022ce288.state++;
        data_ov002_022ce288.count=0;
        return 0;
    case 2:
        if (data_ov002_022ce288.count++ < *(unsigned *)(data_ov002_022d016c+0xd44)) {
            slot=(struct Slot *)func_ov002_021b004c(data_ov002_022ce288.count);
            func_ov002_021afffc(data_ov002_022ce288.count);
            value=func_ov002_021afba0();
            func_ov002_0223de04((struct SelfDE04 *)self,slot->side,value,slot->index*2+slot->side);
            return 0;
        }
        data_ov002_022ce288.state++;
        return 0;
    default: return 1;
    }
}

