#include "ov002_core.h"
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021c8470(int a, int b);
/* This caller supplies only two arguments to the four-argument thunk. */
extern int func_ov002_021bbc58();
extern int func_ov002_021d5a08(struct Ov002Self *arg0, int arg1, int arg2, int arg3, u16 arg4, u16 arg5);
int func_ov002_0221d0d8(struct Ov002Self *self) {
    int i;
    for (i=0; i<5; i++) {
        if (func_ov002_0225764c((int)self, self->b0, i)) {
            int value=0;
            switch (self->f0) {
            case 0x1409:
                value=func_ov002_021c8470(self->b0,i)/5;
                if (value>=0xffff) value=0xffff;
                break;
            case 0x153d:
                value=*(u16 *)((char *)self+8);
                break;
            case 0x15ae:
                value=*(int *)((char *)&data_ov002_022d016c+0xce8);
                break;
            case 0x1882:
                value=func_ov002_021bbc58(self->b0,11)*200;
                break;
            }
            func_ov002_021d5a08(self,self->b0,i,self->f0,2,(u16)value);
        }
    }
    return 0;
}

