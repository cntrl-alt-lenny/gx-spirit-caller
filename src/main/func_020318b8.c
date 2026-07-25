/* func_020318b8 -- C-34 re-audit (cm-parked-reaudit-2 batch B). EUR
 * translation of the already-shipped USA sibling src/usa/main/func_02031864.c
 * (same init-loop + multi-helper-call shape, region-local addresses).
 * Orig has two distinct pool slots for data_0219adb8: the init-loop's
 * &data_0219adb8 argument to func_02034754 (slot A, symbol) and the final
 * `.field_4 = 1` store (slot B, literal in the .s workaround) -- the
 * registered alias `data_0219adb8_alias` (already in symbols.txt/BSS,
 * added alongside the USA fix) splits them (docs/research/codegen-walls.md
 * C-34).
 */

extern void *data_0219adb8;
extern void *data_0219adb8_alias;
extern unsigned char data_0219adcc[];
extern unsigned char data_020fe45c[];
extern void *data_0219b27c;
extern void func_02034754(void *p, unsigned int size);
extern void func_020318a4(void *p);

void func_020318b8(void) {
    int i;
    unsigned char *p5, *p6;
    p5 = data_0219adcc;
    func_02034754(&data_0219adb8, 0x4f4);
    p6 = data_020fe45c;
    for (i = 0; i < 0xc; i++) {
        func_020318a4(p5);
        func_020318a4(p5 + 0x30);
        *(unsigned int *)(p5 + 0x60) = *p6++;
        p5 += 0x64;
    }
    func_020318a4(&data_0219b27c);
    *(int *)((char *)&data_0219adb8_alias + 4) = 1;
}
