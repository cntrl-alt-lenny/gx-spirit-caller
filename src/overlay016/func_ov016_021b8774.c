/* func_ov016_021b8774 — C-34 address-CSE duplicate pool slot (re-audit
 * batch D). data_ov016_021b940c is referenced from two distinct pool
 * words: one is passed as a raw `void**` (4-pointer table) to the
 * row-group-rebuild family (func_ov016_021b8a30/894c/8b10/8bf4/8cd8)
 * and to func_0201ef90 -- confirmed by those sinks' own already-shipped
 * signatures (`void **arg1`) -- the other is used purely for reading
 * back the table's own elements (OS_SPrintf bufs, func_0201ede4's 2nd
 * arg). Technique 1 (literal-address-cast, offset 0): the raw-address
 * sites use a raw numeric-literal cast of the symbol's address instead
 * of the symbol name, so mwcc pool-materializes it as a distinct
 * literal rather than CSE'ing it with the plain symbol reference used
 * at the element-read sites. See docs/research/codegen-walls.md C-34.
 */
#include "ov016_core.h"

extern void Task_InvokeLocked(void *p);
extern void func_ov016_021b8a30(void *arg0, void **arg1);
extern void func_ov016_021b894c(void *arg0, void **arg1);
extern void func_ov016_021b8b10(void *arg0, void **arg1);
extern void func_ov016_021b8bf4(void *arg0, void **arg1);
extern void func_ov016_021b8cd8(void *arg0, void **arg1);
extern void OS_SPrintf(void *out, void *fmt);
extern void func_0201ef3c(int a, void *b, void *c);
extern void func_0201e7e0(void);
extern void func_0201ef90(void *a, void *b, void *c, int d, int e, int f,
                           void **g, int h, int i, void *j);
extern int func_0201ede4(void *a, void *b);

extern char data_ov016_021bb1b0[];
extern char data_ov016_021b940c[];
extern char data_ov016_021b9458[];
extern char data_ov016_021b9478[];
extern char data_ov016_021b9498[];
extern char data_ov016_021b94b8[];
extern char data_ov016_021bb1a4[];

void func_ov016_021b8774(void *self0, void *arg1_0) {
    char *self = (char *)self0;
    char *a1 = (char *)arg1_0;

    if (*(int *)(a1 + 0x44) != 0) {
        int i;
        int *table = (int *)data_ov016_021bb1b0;

        for (i = 0; i < 5; i++) {
            if (table[i] != 0) {
                Task_InvokeLocked((void *)table[i]);
            }
            table[i] = 0;
        }

        *(unsigned char *)(self + 0x1cc) =
            (unsigned char)(*(int *)(a1 + 0x44) & 0x1f);
        *(unsigned char *)(self + 0x1cd) =
            (unsigned char)(((unsigned int)(*(int *)(a1 + 0x44) & 0x3e0)) >> 5);
        *(unsigned char *)(self + 0x1ce) =
            (unsigned char)(((unsigned int)(*(int *)(a1 + 0x44) & 0x7c00)) >> 0xa);
        *(unsigned char *)(self + 0x1cf) =
            (unsigned char)(((unsigned int)(*(int *)(a1 + 0x44) & 0xf8000)) >> 0xf);
        *(unsigned short *)(self + 0x1d0) =
            (unsigned short)(((unsigned int)(*(int *)(a1 + 0x44) & 0x1f00000)) >> 0x14);
        *(int *)(self + 0x1d4) =
            (int)(((unsigned int)(*(int *)(a1 + 0x44) & 0x7e000000)) >> 0x19);

        func_ov016_021b8a30(self, (void **)0x021b940c);
        func_ov016_021b894c(self, (void **)0x021b940c);
        func_ov016_021b8b10(self, (void **)0x021b940c);
        func_ov016_021b8bf4(self, (void **)0x021b940c);
        func_ov016_021b8cd8(self, (void **)0x021b940c);
    } else {
        int tmp;

        OS_SPrintf(((void **)data_ov016_021b940c)[0], data_ov016_021b9458);
        OS_SPrintf(((void **)data_ov016_021b940c)[1], data_ov016_021b9478);
        OS_SPrintf(((void **)data_ov016_021b940c)[2], data_ov016_021b9498);
        OS_SPrintf(((void **)data_ov016_021b940c)[3], data_ov016_021b94b8);

        if (*(int *)(self + 0xb0) != 0) {
            func_0201ef3c(*(int *)(self + 0x5c), self + 0x64, self + 0xb0);
            *(int *)(self + 0xb4) = 0;
            *(int *)(self + 0xb0) = 0;
        }
        func_0201e7e0();
        func_0201ef90(self + 0x5c, self + 0x60, self + 0x64, 0x6000, 0x200, 1,
                       (void **)0x021b940c, 1, -1, self + 0xb0);
        *(int *)(data_ov016_021bb1a4 + 0x10) =
            func_0201ede4(&tmp, ((void **)data_ov016_021b940c)[3]);
    }
}
