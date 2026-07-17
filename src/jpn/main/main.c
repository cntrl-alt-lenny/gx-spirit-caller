/* main: game entry point (C main), ARM-mode. Ported from src/main/main.c
 * (EUR) — callees resolved via find_region_siblings (HIGH confidence,
 * exact reloc-signature match both regions). */

extern void func_02006378(void);
extern void func_0200658c(void);

void main(void) {
    func_02006378();
    func_0200658c();
}
