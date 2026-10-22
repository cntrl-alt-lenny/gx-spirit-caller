typedef unsigned int u32;
typedef struct { int f0, error, f8, slot; } State;
typedef struct { u32 magic, value, size, crc; } Header;
extern int data_02104f3c[];
extern unsigned char data_02104f4c[];
extern int data_020c3f48[];
extern int func_02008598(void);
extern int func_02008548(void);
extern void *func_0209c0cc(void);
extern int func_02090868(void);
extern void func_020908c0(unsigned short);
/* These callers supply only r0; the thunk definitions expose unused registers. */
extern int func_0209bfe4();
extern int func_0209bfd4();
/* The original leaves the byte count in r1, supplying only r0 explicitly. */
extern int func_02007240();
extern int Task_PostLocked(void *arg0, int arg1, int arg2);
extern void Task_InvokeLocked(void *p);
extern int func_0209c7dc(int,int,int,int,int,int,int,int,int);
extern void func_020944a4(int unused0, int unused1, int unused2);
extern void func_020947d0(void *,void *);
extern void func_02008c14(void);
extern void *func_02007230(void);
extern void func_02020ff8(void);
int func_020085e4(void) {
    Header h;
    int success = 0;
    u32 lock;
    int i;
    int slot;
    int valid;
    int buffer;
    int address;
    if (func_02008598() && func_0209c0cc()) {
        lock = func_02090868();
        if (lock != -3) {
            func_0209bfe4((unsigned short)lock);
            for (i=0; i<8 && data_02104f3c[1]==0; i++) {
                slot = (data_02104f3c[3]-i+8)%8;
                address = (slot<<14)+0x20000;
                data_02104f3c[1] |= func_0209c7dc(address,(int)&h,16,0,0,0,6,1,0)==0;
                if (data_02104f3c[1]==0 && h.magic==0x59474454) {
                    valid=1;
                    if (h.size>0x1b0c) valid=0;
                    else {
                        buffer = Task_PostLocked((void *)h.size,4,0);
                        data_02104f3c[1] |= func_0209c7dc(address+16,buffer,h.size,0,0,0,6,1,0)==0;
                        if (h.size==0x1b0c) {
                            if(h.crc!=func_02007240((void *)buffer,h.size)) valid=0;
                            else func_020944a4(buffer,(int)data_02104f4c,h.size);
                        } else {
                            if ((*(u32 *)buffer>>8)==0x1b0c && h.crc==func_02007240((void *)buffer,h.size))
                                func_020947d0((void *)buffer,data_02104f4c);
                            else valid=0;
                        }
                        Task_InvokeLocked((void *)buffer);
                    }
                    if(data_02104f3c[1]==0 && valid) {
                        u32 value = h.value;
                        data_02104f3c[3]=slot;
                        data_020c3f48[2]=value;
                        success=1;
                        break;
                    }
                }
            }
            func_0209bfd4(lock & 0xffff);
            func_020908c0(lock);
            if(success) func_02008c14();
        }
    }
    if(func_02007230()) func_02020ff8();
    if(!success) {
        data_02104f3c[3]=-1;
        func_02008548();
        return 1;
    }
    return data_02104f3c[1]==0;
}






