/* func_ov002_0228de58: r=helper1(self); if(helper2(self,0x1a98,r)){ if(helper3(self,arg1)) return 0x64; return r; } return 0; */

extern int func_ov002_021c84e0(void *self);
extern int func_ov002_022536e8(void *self, int lit, int r);
extern int func_ov002_0228dc90(void *self, int arg1);

int func_ov002_0228de58(void *self, int arg1) {
    int r = func_ov002_021c84e0(self);
    if (func_ov002_022536e8(self, 0x1a98, r)) {
        if (func_ov002_0228dc90(self, arg1))
            return 0x64;
        return r;
    }
    return 0;
}
