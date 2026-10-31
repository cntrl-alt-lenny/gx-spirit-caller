typedef unsigned int u32;
typedef unsigned long long u64;
typedef unsigned short u16;
typedef unsigned char u8;
typedef struct { u32 a, b; u32 lo, hi; u16 flags; u8 tail[2]; } State;
extern u8 data_0219da7c[];
extern u8 data_0219da82[];
extern u8 data_0219da88[];
extern void func_02094688(const void *, void *, u32);
u8 *func_02043a78(State *p) {
    union { u64 wide; struct { u32 lo, hi; } words; } temp;
    u32 lo = p->lo;
    u32 hi = p->hi;
    temp.words.hi = hi;
    temp.words.lo = lo;
    func_02094688(p, data_0219da7c, 5);
    data_0219da7c[5] = ((p->b >> 8) & 7) | ((temp.wide & 31) << 3);
    temp.wide >>= 5;
    func_02094688(&temp, data_0219da82, 4);
    data_0219da7c[10] = ((u32)(temp.wide >> 32) & 63) | ((p->flags & 3) << 6);
    data_0219da7c[11] = p->flags >> 2;
    func_02094688(p->tail, data_0219da88, 2);
    return data_0219da7c;
}



