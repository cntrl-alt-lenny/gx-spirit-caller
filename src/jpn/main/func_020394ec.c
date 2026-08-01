/* func_020394ec: find-or-create record. If data_0219c3a0.f_4 is set, tail
 * calls func_02088f3c(p0) directly. Otherwise computes (r6,r7) selector
 * bits from p2's 0x400/0x200 flags, looks up an existing record via
 * func_0203a7fc (bumps its f_1c counter if found), else allocates+inits a
 * new one via func_02088ffc/func_02038c34 and optionally posts it via
 * func_02038e08/func_02088f20 when p2&0x8000 is set.
 */
typedef unsigned char u8;

typedef struct {
    unsigned short f_0;
    char pad2[2];
    unsigned short f_4;
} Ctl;

typedef struct {
    char pad0[8];
    int f_8;
    int f_c;
    char pad10[0x14 - 0x10];
    int f_14;
    int f_18;
    u8 f_1c;
    u8 f_1d;
    u8 f_1e;
    u8 f_1f;
    char f_20[1];
} Rec;

extern Ctl data_0219c3a0;
extern int data_0219b250;
extern int data_0219c3b4;

extern void *func_02038c34(int a, int b, int c);
extern int func_02038e08(int a, int b, void *c, int d, int e, int f);
extern void func_02038f60(Rec *t);
extern void *func_0203a7fc(int a0);
extern void func_0207d044(void *a, void *b);
extern unsigned int func_02088f20(int idx, void *arg);
extern unsigned int func_02088f3c(unsigned int idx);
extern unsigned int func_02088ffc(unsigned int idx);

void *func_020394ec(int p0, int p1, int p2) {
    Rec *rec;
    int r6, r7;

    if (data_0219c3a0.f_4 != 0) {
        return (void *)func_02088f3c(p0);
    }

    if (p2 & 0x400) {
        r6 = -1;
        r7 = 2;
        if (p2 & 0x200) r7 = 1;
    } else {
        r7 = 0;
        r6 = 1;
    }

    rec = (Rec *)func_0203a7fc(p0);
    if (rec != 0) {
        rec->f_1c = rec->f_1c + 1;
    } else {
        unsigned int r4 = func_02088ffc(p0);
        if (r4 == 0) return 0;

        rec = (Rec *)func_02038c34(data_0219b250, r4 + 0x20, r6 << 5);
        if (rec == 0) return 0;

        rec->f_14 = p0;
        rec->f_8 = 0;
        rec->f_1c = 1;
        rec->f_18 = 0;
        rec->f_1f = (u8)r7;
        rec->f_1e = (u8)p1;
        rec->f_c = r4;
        rec->f_1d = 2;

        if (p2 & 0x8000) {
            if ((unsigned int)func_02038e08(0, p0, rec->f_20, r4, 0, 0) != r4) {
                return 0;
            }
            rec->f_1d = 1;
            func_02088f20(p0, rec->f_20);
        }
        func_0207d044(&data_0219c3b4, rec);
    }

    data_0219c3a0.f_0 = 0x81;
    func_02038f60(rec);
    return rec;
}
