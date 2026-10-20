typedef struct { int pad; unsigned int error; } State;
extern State data_02104f3c;
extern void *func_02007230(void);
/* The second argument is the byte count (0x124 in the original). */
extern int func_02007240(void *a, unsigned int size);
extern void func_02020ff8(void);
extern int func_02090868(void);
extern void func_020908c0(int);
extern void func_02092904(void *, int);
/* The original passes only the handle to these four-argument thunks. */
extern int func_0209bfd4();
extern int func_0209bfe4();
extern void *func_0209c0cc(void);
extern int func_0209c7dc(int,int,int,int,int,int,int,int,int);
typedef struct {
    signed char pad0;
    signed char valid;
    char pad2[26];
    unsigned int a,b,c;
} Save;
int func_02008d60(int slot, Save *p) {
    int result = 0;
    int handle;
    unsigned int address;
    unsigned int header[2];
    int zero;

    if (func_0209c0cc() != 0) {
        handle = func_02090868();
        if (handle != -3) {
            address = (slot << 9) + 0x10000;
            func_0209bfe4((unsigned short)handle);
            func_02092904(header, 8);
            func_02092904(p, 0x124);
            data_02104f3c.error |= !func_0209c7dc(address, (int)header, 8, 0, 0, 0, 6, 1, 0);
            if (data_02104f3c.error == 0 && header[0] == 0x59475243) {
                data_02104f3c.error |= !func_0209c7dc(address + 8, (int)p, 0x124, 0, 0, 0, 6, 1, 0);
                if (data_02104f3c.error == 0) {
                    if (p->valid && p->a <= 0x50 && p->c <= 0x1e && p->b <= 0xf && func_02007240(p, 0x124) == header[1]) {
                        result = 1;
                    } else {
                        zero = 0;
                        func_0209c7dc((int)&zero, address, 4, 0, 0, 0, 7, 10, 2);
                    }
                }
            }
            func_0209bfd4(handle & 0xffff);
            func_020908c0((unsigned int)handle << 16 >> 16);
        }
    }
    if (func_02007230() != 0) func_02020ff8();
    return result;
}







