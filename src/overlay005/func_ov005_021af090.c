typedef struct { unsigned int unk_00; unsigned int mode:3; unsigned int rest:29; } GlobalState;
extern GlobalState data_02104f4c;
typedef struct { char pad0[8]; unsigned int type; char pad1[0x1c]; unsigned short cursor; char pad2[0x1e]; signed char text[0x20]; unsigned char attrs[0x20]; } State;
extern void func_ov005_021aef74(State *p);
extern int func_02037208(int a0, int a1, int a2, int a3);
static inline int limit(State *p) {
    int small=0;
    if(p->type <= 4 && ((1U << p->type) & 0x19)) small=1;
    return small ? 10 : 12;
}
void func_ov005_021af090(State *p) {
    int found=0;
    int i, j, k, l;
    if(data_02104f4c.mode == 0) {
        if(p->cursor != 0) {
            for(i=p->cursor; i<limit(p); i++) {
                if(p->text[i*2] != 0) { found=1; break; }
            }
            if(found==0) p->cursor--;
        }
        p->text[p->cursor*2]=0;
        p->text[p->cursor*2+1]=0;
        for(j=p->cursor; j<limit(p); j++) {
            p->text[j*2]=p->text[(j+1)*2];
            p->text[j*2+1]=p->text[(j+1)*2+1];
        }
    } else {
        if(p->cursor != 0) {
            for(k=p->cursor; k<limit(p)*2; k++) {
                if(p->text[k] != 0) { found=1; break; }
            }
            if(found==0) p->cursor--;
        }
        p->text[p->cursor]=0;
        p->attrs[p->cursor]=0;
        for(l=p->cursor; l<limit(p)*2; l++) {
            p->text[l]=p->text[l+1];
            p->attrs[l]=p->attrs[l+1];
        }
    }
    func_ov005_021aef74(p);
    func_02037208(0x43,-1,0,1);
}



