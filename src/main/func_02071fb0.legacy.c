typedef struct sub sub_t;
extern int func_020720b4(void *a0, void *a1, void *a2);
extern void func_02072144(unsigned short *header, unsigned short *packet, void *connection);
extern sub_t *func_02072600(void *r0, void *r1);
extern int func_020727dc(int a0, int a1);
extern void func_020918d0(void);
static inline unsigned short Swap16(int value) { return (value >> 8) | (value << 8); }
static inline unsigned int Read32(unsigned short *p) { return (Swap16(p[0]) << 16) | Swap16(p[1]); }
void func_02071fb0(unsigned short *header, unsigned short *packet, void *arg)
{
    sub_t *c;
    if (!func_020727dc(Read32(header + 6), Read32(header + 8))) return;
    if (func_020720b4(header, packet, arg)) return;
    c = func_02072600(header, packet);
    if (c != 0) {
        func_02072144(header, packet, c);
        return;
    }
    func_020918d0();
    c = func_02072600(header, packet);
    if (c != 0) func_02072144(header, packet, c);
}
