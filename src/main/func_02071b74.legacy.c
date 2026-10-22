typedef struct { unsigned short half_0, half_2; } A1_02072544_t;
typedef struct { unsigned char pad[12]; unsigned short half_c, half_e; } A0_02072544_t;
typedef struct { unsigned char pad[8]; unsigned char byte8, pad9; unsigned short half_a; unsigned char padc[12]; unsigned short half_18, pad1a; unsigned int word_1c; } A2_02072544_t;
typedef struct { char pad[0x64]; unsigned int flag; } ctx_020919d8_t;
extern A2_02072544_t *func_020724c8(A0_02072544_t *, A1_02072544_t *);
extern void func_02072234(unsigned short *, unsigned short *, unsigned int, int);
extern int func_02072370(int, int);
extern int func_02072384(int, int);
extern void func_020918d0(void);
extern void func_020919d8(ctx_020919d8_t *);
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void func_02094688(const void *, void *, unsigned int);
static inline unsigned short Swap16(int v) { return (v >> 8) | (v << 8); }
static inline unsigned int Read32(unsigned short *p) { return (Swap16(p[0]) << 16) | Swap16(p[1]); }
void func_02071b74(unsigned short *header, unsigned short *packet, unsigned int size)
{
    char *c = (char *)func_020724c8((A0_02072544_t *)header, (A1_02072544_t *)packet);
    int flags;
    unsigned int seq;
    int complete;
    int saved;
    if (!c) {
        func_02072234(header, packet, size, 0);
        return;
    }
    flags = ((unsigned char *)packet)[13];
    *(unsigned int *)(c + 0x30) = Read32(packet + 4);
    seq = Read32(packet + 2);
    if ((unsigned char)c[8] == 4 && *(unsigned int *)(c + 0x24) != seq) {
        func_02072384((int)c, 0);
        return;
    }
    *(unsigned short *)(c + 0x2c) = Swap16(packet[7]);
    switch ((unsigned char)c[8]) {
    case 0:
    case 2:
        func_02072234(header, packet, size, 0);
        break;
    case 3:
        c[8] = 4;
        if (*(int *)(c + 4) == 1) {
            *(int *)(c + 4) = 0;
            func_020919d8(*(ctx_020919d8_t **)c);
        }
        if (size == 0) break;
    case 4:
        ++*(unsigned int *)(c + 0x34);
        if (size > *(unsigned int *)(c + 0x3c) - *(unsigned int *)(c + 0x44)) {
            complete = 0;
            size = *(unsigned int *)(c + 0x3c) - *(unsigned int *)(c + 0x44);
        } else complete = 1;
        if (size != 0) {
            saved = OS_DisableIrq();
            func_02094688((char *)packet + (((unsigned char *)packet)[12] & 0xf0) / 4,
                *(char **)(c + 0x40) + *(unsigned int *)(c + 0x44), size);
            *(unsigned int *)(c + 0x44) += size;
            *(unsigned int *)(c + 0x24) += size;
            OS_RestoreIrq(saved);
            if (*(int *)(c + 4) == 2) {
                *(int *)(c + 4) = 0;
                func_020919d8(*(ctx_020919d8_t **)c);
            }
        }
        if (complete && (flags & 1)) {
            c[8] = 6;
            ++*(unsigned int *)(c + 0x24);
            func_02072370((int)c, 0);
            if (size == 0 && *(int *)(c + 4) == 2) {
                *(int *)(c + 4) = 0;
                func_020919d8(*(ctx_020919d8_t **)c);
            }
        } else if (size != 0) func_02072384((int)c, 0);
        break;
    case 7:
    case 8:
        if (flags & 1) {
            *(unsigned int *)(c + 0x24) += size + 1;
            func_02072384((int)c, 0);
            c[8] = 0;
            if (*(int *)(c + 4) == 2) {
                *(int *)(c + 4) = 0;
                func_020919d8(*(ctx_020919d8_t **)c);
            }
        } else {
            if (size != 0) {
                *(unsigned int *)(c + 0x24) += size;
                func_02072384((int)c, 0);
            }
            c[8] = 8;
        }
        break;
    case 6:
    case 9:
        c[8] = 0;
        if (*(int *)(c + 4) == 2) {
            *(int *)(c + 4) = 0;
            func_020919d8(*(ctx_020919d8_t **)c);
        }
        break;
    default:
        if (flags & 1) ++*(unsigned int *)(c + 0x24);
        func_02072384((int)c, 0);
        break;
    }
    func_020918d0();
}

