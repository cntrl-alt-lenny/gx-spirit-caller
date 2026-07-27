/* func_ov002_0228dd48: r=helper1(self); if(helper2(self,0x1a98,r)){ if(helper3(self,arg1)) return 0x64; return r; } return 0; */

extern int func_ov002_021c8400(void *self);
extern int func_ov002_02253600(void *self, int lit, int r);
extern int func_ov002_0228db80(void *self, int arg1);

int func_ov002_0228dd48(void *self, int arg1) {
    int r = func_ov002_021c8400(self);
    if (func_ov002_02253600(self, 0x1a98, r)) {
        if (func_ov002_0228db80(self, arg1))
            return 0x64;
        return r;
    }
    return 0;
}
