typedef unsigned int u32;
typedef unsigned long long u64;
extern int func_02096358(int a, int b, int c);
extern void func_020928cc(void *, u32);
extern u64 func_020930b0(void);
extern u64 func_020b3808(u64, u64);
/* BIOS thunk's C definition omits the r0 delay argument used by callers. */
extern void WaitByLoop();
extern unsigned short data_0219da70;
extern int data_0219da74;
extern unsigned char data_0219daa0[];
extern void func_02002200(void);
static inline int send1(u32 a, u32 b, u32 c) {
    if (func_02096358(4, ((a >> 16) & 0xff) | 0x02002300, 0) < 0) return 0;
    if (func_02096358(4, (a & 0xffff) | 0x10000, 0) < 0) return 0;
    if (func_02096358(4, 0x20000, 0) < 0) return 0;
    if (func_02096358(4, (b & 0xffff) | 0x30000, 0) < 0) return 0;
    if (func_02096358(4, (c >> 16) | 0x40000, 0) < 0) return 0;
    if (func_02096358(4, (c & 0xffff) | 0x01050000, 0) < 0) return 0;
    return 1;
}
static inline int send2(u32 a, u32 b, u32 c) {
    if (func_02096358(4, ((a >> 16) & 0xff) | 0x02002500, 0) < 0) return 0;
    if (func_02096358(4, (a & 0xffff) | 0x10000, 0) < 0) return 0;
    if (func_02096358(4, b | 0x20000, 0) < 0) return 0;
    if (func_02096358(4, (c >> 16) | 0x30000, 0) < 0) return 0;
    if (func_02096358(4, (c & 0xffff) | 0x01040000, 0) < 0) return 0;
    return 1;
}
static inline int send3(u32 a, u32 b, u32 c) {
    if (func_02096358(4, (u32)func_02002200 | ((u32)data_0219daa0 >> 24), 0) < 0) return 0;
    if (func_02096358(4, (((u32)data_0219daa0 >> 8) & 0xffff) | 0x10000, 0) < 0) return 0;
    if (func_02096358(4, (((u32)data_0219daa0 << 8) & 0xff00) | 0x01020000, 0) < 0) return 0;
    return 1;
}
int func_02043d3c(u32 state, u32 a, u32 b, u32 c) {
    int sent = 0;
    u64 start;
    for (;;) {
        if (!sent) {
            data_0219da74 = 0;
            switch (state) {
            case 1:
                sent = send1(a, b, c);
                break;
            case 2: sent = func_02096358(4, 0x03002000, 0) >= 0; break;
            case 3:
                sent = send2(a, b, c);
                start = func_020930b0();
                break;
            case 4:
            case 5:
                sent = send3(a, b, c);
                break;
            case 6: sent = func_02096358(4, 0x03002d00, 0) >= 0; break;
            case 7: sent = func_02096358(4, 0x03002100, 0) >= 0; break;
            }
        } else if (data_0219da74 == 1) {
            sent = 0;
            if (data_0219da70 == 0) {
            switch (state) {
            case 1: return 1;
            case 2: state = 4; break;
            case 3: state = 5; break;
            case 4:
            case 5:
                func_020928cc(data_0219daa0, 1);
                if (state == 4) {
                    if (data_0219daa0[0] & 2) state = 3;
                    else return 0;
                } else {
                    if (!(data_0219daa0[0] & 1)) return 1;
                    if ((data_0219daa0[0] & 0x20) || func_020b3808((func_020930b0() - start) << 6, 0x82ea) > 4000) state = 6;
                    else WaitByLoop(0x4000);
                }
                break;
            case 6: return 0;
            case 7: return 1;
            }
            } else return 0;
        }
    }
}







