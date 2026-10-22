extern char data_ov004_0220b500[];
extern char data_02104bac[];
extern unsigned int func_02006194(void);
extern unsigned int func_0200617c(void);
extern void func_0200612c(int *, int *);
extern void func_02006110(int *, int *);
extern int func_02037208(int, int, int, int);
extern void func_ov004_021da848(int);
extern void func_ov004_021da91c(void);
extern int func_ov004_021da978(void);
extern int func_ov004_021daa48(void);
/* The existing void thunk omits the second argument and return value of
 * its underlying func_ov004_021d38c4; this caller uses both. */
extern int func_ov004_021dabc0(int, int *);
extern void func_ov004_021dabcc(int);
extern void func_ov000_021abf28(void *, unsigned);
extern unsigned int func_ov000_021abf40(void *);
extern void func_ov000_021abf50(int *, int);
extern void func_ov000_021ac144(void *);
#define F(o) (*(int *)(b + (o)))
typedef struct { unsigned low:16; unsigned high:16; } Range;
void func_ov004_021dac7c(void) {
    char *b = data_ov004_0220b500;
    int found = 0;
    int i;
    int x2, y2, x, y;
    F(0x9c) = 0;
    F(0xa0) = 0;
    F(0xa8) = -1;
    if (F(0x8c) >= 0x100 || F(0x88) >= 0) return;
    F(0x94) = 0;
    F(0xa4) = F(0xa4) < 0 ? 0 : F(0xa4);
    for (i = 0; i < 32; i++) {
        if (func_ov004_021dabc0(i, 0)) {
            int n = F(0x98);
            if (n <= i + 1) n = i + 1;
            F(0x98) = n;
            ((Range *)(b + 0x200))->high = n * 6;
            found = 1;
        }
    }
    if (found) func_ov004_021da848(2);
    else func_ov004_021da848(1);
    for (i = 0; i < 5; i++) {
        int n = (F(0xa4) - 8) / 48 + i;
        func_ov004_021dabc0(n, (int *)(b + 0xb8 + n % 5 * 32));
    }
    func_ov000_021abf28(b + 0x1f8, F(0x98) >= 4);
    if (F(0x8c) != 0) return;
    func_ov000_021ac144(b + 0x1f8);
    F(0xa4) = func_ov000_021abf40(b + 0x1f8) * 8;
    if (func_02006194() || func_0200617c()) {
        func_0200612c(&x, &y);
        func_02006110(&x2, &y2);
        if (x >= 0 && x < 236 && y2 >= 32 && y >= 32) {
            int pos = F(0xa4) + y2 - 32;
            int rem = pos % 48;
            int row = pos / 48;
            int slot;
            unsigned kind;
            if (rem >= 46) F(0x60) = 1;
            F(0x90) = row;
            slot = row % 4;
            kind = *(unsigned *)(b + 0x158 + slot * 32);
            if (kind == 1 || kind == 6 || kind >= 4000) {
                F(0xa8) = slot;
                if (func_0200617c()) func_ov004_021dabcc(row);
            }
        }
    } else if (*(unsigned short *)(data_02104bac + 0x54) & 1) {
        int row = F(0x90);
        if (row < 0) {
            F(0x9c) = 1;
            func_ov004_021da91c();
        } else if (row * 48 >= F(0xa4) && (row + 1) * 48 <= F(0xa4) + 160 && func_ov004_021dabc0(row, 0)) {
            unsigned kind;
            int slot;
            row = F(0x90);
            slot = row % 4;
            F(0xa8) = slot;
            kind = *(unsigned *)(b + 0x158 + slot * 32);
            if (kind == 1 || kind == 6 || kind >= 4000) func_ov004_021dabcc(row);
        }
    } else {
        int count = 0;
        int last = 0;
        for (i = 0; i < F(0x98); i++) {
            if (func_ov004_021dabc0(i, 0)) { last = i; count++; }
        }
        if (count == 0) F(0x90) = -1;
        if (*(unsigned short *)(data_02104bac + 0x56) & 0x40) {
            int row = F(0x90);
            if (row == 0) F(0x90) = -1;
            else {
                F(0x90) = -1;
                for (i = row - 1; i >= 0; i--) {
                    if (func_ov004_021dabc0(i, 0)) {
                        int top = i * 48;
                        int scroll = F(0xa4);
                        F(0x90) = i;
                        if (top < scroll) F(0xa4) = top;
                        else if ((i + 1) * 48 > scroll + 160) F(0xa4) = top - 112;
                        func_ov000_021abf50((int *)(b + 0x1f8), F(0xa4) / 8);
                        func_02037208(56, -1, 0, 1);
                        break;
                    }
                }
            }
        } else if (*(unsigned short *)(data_02104bac + 0x56) & 0x80) {
            for (i = F(0x90) + 1; i < F(0x98); i++) {
                if (func_ov004_021dabc0(i, 0)) {
                    int top = i * 48;
                    int scroll = F(0xa4);
                    F(0x90) = i;
                    if (top < scroll) F(0xa4) = top;
                    else if ((i + 1) * 48 > scroll + 160) F(0xa4) = top - 112;
                    func_ov000_021abf50((int *)(b + 0x1f8), F(0xa4) / 8);
                    func_02037208(56, -1, 0, 1);
                    break;
                }
            }
        } else if (count == 1 && F(0x90) >= 0) F(0x90) = last;
    }
    F(0x9c) |= func_ov004_021da978();
    F(0xa0) = func_ov004_021daa48();
}




