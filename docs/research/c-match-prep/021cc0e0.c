/* CAMPAIGN-PREP candidate for func_021cc0e0 (ov004, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: nibble :3 bitfield both arms + exact store-order record build
 *   risk:       struct-guessed: pool/_LIT mapping + 0x54-record field offsets inferred from sp stores (listing truncated, no _LIT block); also permuter-class strh/strb store scheduling. Confirm struct + the data_0210xxxx base each ldr targets.
 *   confidence: low
 */
/* func_ov004_021cc0e0: two-arm record marshaller keyed on b500.f44.
 *   f44==0 arm: zero a 0x10 block, build a {u16 p1, u16 view52, u16 nibble}
 *     header + a 0x1a name region, ship via func_020944a4 then func_0201cd1c(2,..).
 *   else arm: func_02052e30 fill, build a larger 0x54 record (two view u16s,
 *     nibble byte, copied strings, flags), ship via func_02094688 + func_0201cd1c.
 * Class D: nibble lsl#1d;lsr#1d bitfield + dense store-order marshalling.
 * NOTE: tail truncated in source listing at `.L_1e4: mov r0,#1` — returns 1. */
extern char data_02104f4c[];      /* _LIT2: b500-ish (a3c nibble, a64, b00) */
extern char data_0210594c[];
extern char data_02105989[];
extern char data_02105a4d[];
extern char data_02105b70[];
extern char data_ov004_0220b500[]; /* _LIT0: state struct, field +0x44 */
extern void func_0201cd1c(int a, void *b, int c);
extern void func_02052e30(void *a, void *b);
extern void func_020944a4(void *a, void *b, int c);
extern void func_02094688(void *a, void *b, int c);
extern void func_020aadf8(void *dst, void *src);
extern void func_020aaec0(void *dst, void *src, int n);

typedef struct { unsigned char bf : 3; } nibble3_t;

int func_ov004_021cc0e0(unsigned short p1) {
    char *st = data_ov004_0220b500;
    char *g  = data_02104f4c;
    unsigned char nib;
    if (*(int *)(st + 0x44) != 0) {
        char buf[0x10];
        unsigned short view52, nmeta[3];
        func_020aaec0(buf, data_0210594c, 0x10);
        view52 = *(unsigned short *)(data_02105989 /*_LIT3*/ + 0x52);
        nib = ((nibble3_t *)(g + 0xa3c))->bf;
        nmeta[0] = p1;       /* sp[0x14] */
        nmeta[1] = view52;   /* sp[0x16] */
        nmeta[2] = nib;      /* sp[0x18] */
        func_020944a4(buf, &nmeta_region, 0x14);
        func_0201cd1c(2, nmeta, 0x1a);
        return 1;
    } else {
        struct {
            char a[0x10];          /* sp[0x30] */
            unsigned char nibble;  /* sp[0x40] */
            char s0[0x16];         /* sp[0x41] */
            char s1[0x16];         /* sp[0x57] */
            unsigned short v70;    /* sp[0x70] */
            unsigned short v72;    /* sp[0x72] */
            int  f74;              /* sp[0x74] */
            int  f78;              /* sp[0x78] */
            unsigned char f80, f81, f82;
        } rec;
        unsigned short hdr;        /* sp[0x84] = p1 */
        func_02052e30(data_02105a4d, rec.a);
        rec.v70 = *(unsigned short *)(data_02105989 + 0x52);
        rec.v72 = *(unsigned short *)(data_02105989 + 0x58);
        nib = ((nibble3_t *)(g + 0xa3c))->bf;
        rec.nibble = nib;
        func_020aadf8(rec.s0, data_0210594c);
        rec.s1[-1] = *(unsigned char *)(g + 0xb00);
        func_020aadf8(rec.s1, data_02105b70);
        rec.f74 = *(int *)(g + 0xa64);
        hdr = p1;
        rec.f81 = 0; rec.f80 = 0; rec.f78 = 1; rec.f82 = 0; rec.f74 = 0; /* see store-order risk */
        func_02094688(rec.a, &hdr, 0x54);
        func_0201cd1c(2, &hdr, 0x56);
        return 1;
    }
}
