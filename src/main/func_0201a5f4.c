typedef unsigned int u32;
typedef struct { u32 low:9; u32 seen:1; u32 high:22; } Flags;
typedef struct { char pad[0x8e8]; Flags flags; char gap[0x18]; u32 newbits; } Work;
typedef struct { char pad[0x18]; u32 value:16; u32 other:16; } Entry;
extern char *GetSystemWork(void);
/* This caller supplies no arguments, unlike the four-parameter thunk definition. */
extern int func_020190c0();
extern int func_0201a4dc(void);
extern int func_0201a594(void);
extern int func_0201a3ec(void);
extern int func_02018f80(void);
extern int func_0201a498(void);
extern int func_0201a5c0(void);
extern int func_0201a530(void);
extern char *func_02018b94(void);
extern int func_02019a58(int);
extern void func_02018a84(void *, void *);
typedef struct { char pad[0x854]; u32 count1; u32 count2; char gap[8]; u32 bits; } Data;
extern Data data_02105f4c;
int func_0201a5f4(int mode) {
    Work *work = (Work *)GetSystemWork();
    int result = 0;
    int item;
    int state;
    u32 bits;
    Entry *entry;
    switch (mode) {
    case 0:
        state = func_0201a4dc();
        if (state != 0) {
            if (state == 2 && work->flags.seen == 0) {
                work->flags.seen = 1;
                result |= 2;
            }
            if (func_020190c0() == 3) result |= 4;
            if (func_0201a594() != 0) result |= 8;
            if (func_0201a3ec() != 0 && func_02018f80() >= 11) {
                result |= 16;
            } else if (func_0201a498() != 0) result |= 32;
            if (result == 0) result |= 64;
        } else result |= 1;
        break;
    case 1:
        bits = func_0201a5c0();
        bits &= ~data_02105f4c.bits;
        if (bits != 0) {
            work->newbits = bits;
            data_02105f4c.bits |= bits;
            result |= 128;
        }
        if (func_0201a530() != 0) {
            switch (func_0201a4dc()) {
            case 2: case 3:
                item = 31;
                data_02105f4c.count2 -= 5000;
                break;
            case 1:
                item = 30;
                data_02105f4c.count1 -= 5000;
                break;
            }
            entry = (Entry *)func_02018b94();
            entry->value = func_02019a58(item);
            func_02018a84((void *)((Entry *)func_02018b94())->value, (void *)1);
            result |= 256;
        }
        result |= 512;
        break;
    }
    return result;
}





