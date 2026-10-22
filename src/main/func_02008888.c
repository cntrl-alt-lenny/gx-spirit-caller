extern void func_02000d0c(void);
extern int Task_PostLocked(void *, int, int);
extern void Task_InvokeLocked(void *);
extern unsigned int func_02094b24(unsigned char *, unsigned int, unsigned char *);
extern int func_02007240(void *, void *);
extern void *func_02007230(void);
extern void *func_0209c0cc(void);
extern int func_02090868(void);
extern void func_020908c0(unsigned short);
/* The original supplies only the handle to these four-argument thunks. */
extern int func_0209bfe4();
extern int func_0209bfd4();
extern int func_0209c7dc(int,int,int,int,int,int,int,int,int);
extern void func_02021008(void);
extern unsigned char data_02104f4c[];
typedef struct { int a, error, c, count; } State;
extern State data_02104f3c;
extern int data_020c3f48[];
typedef struct { int magic, count, size, crc; } Header;
int func_02008888(void)
{
    int task;
    int status;
    int error;
    Header h;
    int handle;
    int address;
    unsigned char *p;
    func_02000d0c();
    task = Task_PostLocked((void *)0x1b0c,4,0);
    h.magic = 0x59474454;
    h.count = ++data_020c3f48[2];
    p = (unsigned char *)task;
    h.size = func_02094b24(data_02104f4c,0x1b0c,(unsigned char *)task);
    if (h.size == 0) {
        h.size = 0x1b0c;
        p = data_02104f4c;
    }
    h.crc = func_02007240(p,(void *)h.size);
    if (func_0209c0cc() != 0) {
        handle = func_02090868();
        if (handle != -3) {
            func_0209bfe4(handle & 0xffff);
            error = data_02104f3c.error |= !func_0209c7dc(0,(int)&status,4,0,0,0,6,1,0);
            for (status = 0; status < 2 && error == 0; status++) {
                data_02104f3c.count++;
                address = data_02104f3c.count % 8;
                address = (address << 14) + 0x20000;
                error = data_02104f3c.error |= !func_0209c7dc((int)&h,address,16,0,0,0,7,10,2);
                if (error) break;
                error = data_02104f3c.error |= !func_0209c7dc((int)p,address+16,h.size,0,0,0,7,10,2);
                if (error) break;
            }
            func_0209bfd4((unsigned short)handle);
            func_020908c0((unsigned short)handle);
        }
    }
    Task_InvokeLocked((void *)task);
    if (func_02007230()) func_02021008();
    return data_02104f3c.error == 0;
}



