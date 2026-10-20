typedef struct {
    unsigned short f0;
    unsigned short bit0:1;
    unsigned short rest:15;
    char pad4[4];
    unsigned short masks[2];
    unsigned short total;
} Self;
typedef struct { char pad[0x5b4]; int state; } State;
typedef struct { char pad[0xd70]; int slot, first, second; } Request;
extern State data_ov002_022ce288;
extern Request data_ov002_022d016c;
extern void func_ov002_021ae400(int a, int b);
/* Original caller supplies only r0-r1 to this four-parameter thunk. */
extern int func_ov002_021c84e0();
extern void func_ov002_021ded30(unsigned short *p, int arg1);
extern int func_ov002_021e7584(void *arg0, int arg1, int arg2);
/* Original caller supplies only r0-r1 to this four-parameter thunk. */
extern int func_ov002_02257878();
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
int func_ov002_021fbc08(Self *p) {
    int slot, bit;
    switch(data_ov002_022ce288.state) {
    case 0:
        p->masks[1] = 0;
        p->masks[0] = 0;
        p->total = 0;
        func_ov002_021ae400(p->bit0, 0x3a);
        data_ov002_022ce288.state++;
    case 1:
        func_ov002_0225935c(p->bit0, p->f0, (int)func_ov002_021e7584);
        data_ov002_022ce288.state++;
        return 0;
    case 2:
        if(func_ov002_022593f4()) {
            slot = data_ov002_022d016c.slot;
            bit = data_ov002_022d016c.first + data_ov002_022d016c.second;
            p->total += func_ov002_021c84e0(slot, bit);
            p->masks[slot] |= 1 << bit;
            if(func_ov002_02257878((int)p, (int)func_ov002_021e7584) == 0) {
                data_ov002_022ce288.state++;
                return 0;
            } else {
                data_ov002_022ce288.state--;
                return 0;
            }
        } else {
            if(p->total == 0) { data_ov002_022ce288.state = 0; return 0; }
            data_ov002_022ce288.state++;
            return 0;
        }
    case 3:
        func_ov002_021ded30((unsigned short *)p, p->masks[0] | (p->masks[1] << 16));
        data_ov002_022ce288.state++;
        return 0;
    }
    return 1;
}

